compatability-policy {
    minimum: "1.2.0.0";
    maximum: "${OneLessThanCurrent}"; // this is the default
    versions : {
        "1.2",
    }; // if not specified, find the versions by looking at the feeds and finding all the major/minor versions in range.
}
