{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, pytablewriter
, pytest
, pytest-md-report
, tcolorpy
, doCheck ? true
}:

let
  pname = "pytablewriter-altrow-theme";
  version = "0.0.3";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0xsvc2z0kr8gbnmdgkw1i9nq7rvlxpv0r2qc2zyv3hngnrgvc91z";
  };

  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [ tcolorpy ];
  checkInputs = [
    (pytablewriter.override { doCheck = false; })
    pytest
  ];

  postPatch = ''
    sed -i '/^pytablewriter[<=>]/d' requirements/requirements.txt
    sed -i '/^\(md_report\|discord\)/d' pyproject.toml
  '';
  inherit doCheck;
  checkPhase = "pytest";

  meta = with lib; {
    homepage = "https://github.com/thombashi/pytablewriter-altrow-theme";
    description = "Pytablewriter plugin to provide a theme that colored rows alternatively";
    license = licenses.mit;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
