{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, pytablewriter
, pytest
, tcolorpy
, typepy
}:

let
  pname = "pytest-md-report";
  version = "0.3.0";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0m82knv90p66z9makfvgv6j4mylfb3bylcp7ik913yxsf5ckrbxd";
  };

  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [ pytablewriter pytest tcolorpy typepy ];
  checkInputs = [ pytest ];

  checkPhase = "pytest";

  meta = with lib; {
    homepage = "https://github.com/thombashi/pytest-md-report";
    description = "Pytest plugin to make a test results report with Markdown table format"; # FIXME
    license = licenses.mit;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
