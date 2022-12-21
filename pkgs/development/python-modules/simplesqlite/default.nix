{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, dataproperty
, loguru
, mbstrdecoder
, pathvalidate
, sqliteschema
, tabledata
, typepy
, withLogging ? true
}:

let
  pname = "SimpleSQLite";
  version = "1.3.0";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "1y1vsh88zi63hxrlk8svaqghld68nkyvcwyccpk5j84qqnz65s7p";
  };

  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [
    dataproperty
    mbstrdecoder
    pathvalidate
    sqliteschema
    tabledata
    typepy
  ] ++ lib.optional withLogging loguru;
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/thombashi/SimpleSQLite";
    description = "Python library to simplify SQLite database operations";
    license = licenses.mit;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
