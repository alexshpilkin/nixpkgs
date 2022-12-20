{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, dateutil
, mbstrdecoder
, packaging
, pytest
, pytz
, tcolorpy
}:

let
  pname = "typepy";
  version = "1.3.0";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0k5qwh1w4qplvl99i0yswaw6p3n5yrckji6ijd4id0s0c4q8ay4n";
  };

  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [ dateutil mbstrdecoder packaging pytz ];
  checkInputs = [ pytest tcolorpy ];

  checkPhase = "pytest";

  meta = with lib; {
    homepage = "https://github.com/thombashi/typepy";
    description = "Python library for variable type checker/validator/converter at run time";
    license = licenses.mit;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
