module allergenes;

import std.regex : replaceAll, regex;
import std.string : strip;

auto removeAllergenes(string productName)
{
    auto allergeneFinder = regex(r"\([A-Z\d]{1,2}(,[A-Z\d]{1,2})*\)");
    return productName.replaceAll(allergeneFinder, "").strip;
}

unittest
{
    assert("(1)".removeAllergenes == "");
    assert("(A)".removeAllergenes == "");
    assert("(11)".removeAllergenes == "");
    assert("(1,A,11)".removeAllergenes == "");
    assert("(karibisch)".removeAllergenes == "(karibisch)");
    assert("Hähnchenbrust (karibisch) (12,G,3)".removeAllergenes == "Hähnchenbrust (karibisch)");
}
