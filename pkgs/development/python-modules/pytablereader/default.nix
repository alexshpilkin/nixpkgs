{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, beautifulsoup4
, dataproperty
, jsonschema
, mbstrdecoder
, path
, pathvalidate
, tabledata
, typepy
}:

let
  pname = "pytablereader";
  version = "0.31.3";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "04fzj42sn57bifzdkmpasw3jss542vkq771xyph6ym4nrlgbi4p2";
  };

  propagatedBuildInputs = [
    beautifulsoup4
    dataproperty
    jsonschema
    mbstrdecoder
    path
    pathvalidate
    tabledata
    typepy
  ];
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/thombashi/pytablereader";
    description = "Python library to load structured table data from files/strings/URL with various data format";
    license = licenses.mit;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
