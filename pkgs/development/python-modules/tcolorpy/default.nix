{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
}:

let
  pname = "tcolorpy";
  version = "0.1.2";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0vmp0gs6irgd4a3wpzj18n3g085nwqb43q4a0hanfvnsm8lrqrla";
  };

  disabled = pythonOlder "3.6";
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/thombashi/tcolorpy";
    description = "Python library to apply color to terminal text";
    license = licenses.mit;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
