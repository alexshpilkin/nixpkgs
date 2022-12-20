{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, mbstrdecoder
, tabledata
, typepy
}:

let
  pname = "sqliteschema";
  version = "1.3.0";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "1hyk6al02yb3kj42n173w8b9h0b036xj6mjs2fcs0m5bgh4dbk8s";
  };

  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [ mbstrdecoder tabledata typepy ];
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/thombashi/sqliteschema";
    description = "Python library to dump table schema of a SQLite database file";
    license = licenses.mit;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
