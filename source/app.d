import std.algorithm : filter, map, startsWith;
import std.conv : to;
import std.csv : csvReader, Malformed;
import std.algorithm : joiner, sort, splitter, uniq;
import std.array : array, join, replace, split;
import std.datetime : Clock, DayOfWeek, dur;
import std.encoding : transcode, Windows1252String;
import std.format : format;
import std.getopt : defaultGetoptPrinter, getopt;
import std.json : JSONValue;
import std.stdio : File, writeln;

import allergenes;

import requests : getContent;

enum ver = "v0.1.0";
enum programName = "canteenmenu";

auto getDateOfInterest()
{
    auto currentTime = Clock.currTime;

    final switch (currentTime.dayOfWeek)
    {
    case DayOfWeek.mon:
    case DayOfWeek.tue:
    case DayOfWeek.wed:
    case DayOfWeek.thu:
        if (currentTime.hour < 14)
        {
            return currentTime;
        }
        else
        {
            return currentTime + dur!"days"(1);
        }
    case DayOfWeek.fri:
        if (currentTime.hour < 14)
        {
            return currentTime;
        }
        else
        {
            return currentTime + dur!"days"(3);
        }
    case DayOfWeek.sat:
        return currentTime + dur!"days"(2);
    case DayOfWeek.sun:
        return currentTime + dur!"days"(1);
    }
}

auto getProductGroup(Content)(Content content, string warengruppe, string dateOfInterestString)
{
    return content.csvReader!(string[string])(null, ';', Malformed.ignore)
        .filter!(a => a["datum"] == dateOfInterestString && a["warengruppe"].startsWith(
                warengruppe)).map!(data => ["name" : data["name"].removeAllergenes,
                "notes" : data["kennz"].split(',').sort.uniq.join(','), "price" : data["stud"]])
        .array;
}

void main(string[] args)
{
    string fileName;
    bool versionWanted;
    auto helpInformation = getopt(args, "file|f", "The file that the data is written to.",
            &fileName, "version|v", "Display the version of this program.", &versionWanted);
    if (helpInformation.helpWanted)
    {
        defaultGetoptPrinter("Usage: canteenmenu [options]\n\n Options:", helpInformation.options);
        return;
    }

    if (versionWanted)
    {
        writeln(programName, " ", ver);
        return;
    }

    auto dateOfInterest = getDateOfInterest;
    auto dateOfInterestString = "%02s.%02s.%s".format(dateOfInterest.day,
            dateOfInterest.month.to!int, dateOfInterest.year);

    string content;
    (cast(Windows1252String)(getContent(
            "https://www.stwno.de/infomax/daten-extern/csv/UNI-R/%s.csv".format(
            dateOfInterest.isoWeek)).data)).transcode(content);

    // TODO: This is ugly, but csvReader does not return a ForwardRange, so I saw no other way to do this quickly :( 
    auto soups = content.getProductGroup("Suppe", dateOfInterestString);
    auto mainDishes = content.getProductGroup("HG", dateOfInterestString);
    auto sides = content.getProductGroup("B", dateOfInterestString);
    auto desserts = content.getProductGroup("N", dateOfInterestString);
    JSONValue j = ["date" : dateOfInterestString];
    j.object["mensaMenu"] = ["soups" : soups, "mainDishes" : mainDishes, "sides"
        : sides, "desserts" : desserts];

    if (fileName !is null)
    {
        auto output = File(fileName, "w");
        scope (exit)
            output.close;
        output.writeln(j.toPrettyString.replace("\\/", "/"));
    }
    else
    {
        j.toPrettyString.replace("\\/", "/").writeln;
    }
}
