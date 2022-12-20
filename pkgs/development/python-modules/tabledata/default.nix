{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, dataproperty
, typepy
}:

let
  pname = "tabledata";
  version = "1.3.0";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "1sb19mz8vyanmgk81yi7f1rrbbyvcl4sd80y4lwgmy2qkq61nm2l";
  };

  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [ dataproperty typepy ];
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/thombashi/tabledata";
    description = "Python library to represent tabular data";
    license = licenses.mit;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
