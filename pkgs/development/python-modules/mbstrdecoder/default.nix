{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, chardet
, faker
, pytest
}:

let
  pname = "mbstrdecoder";
  version = "1.1.1";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "13869qvl3kgbaski91792wa17iqdf5nljvrpknldvbdvj8xl368a";
  };

  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [ chardet ];
  checkInputs = [ faker pytest ];

  postPatch = ''
    sed -i '/^md_report/d' pyproject.toml
  '';
  checkPhase = "pytest";

  meta = with lib; {
    homepage = "https://github.com/thombashi/mbstrdecoder";
    description = "Multi-byte character string decoder";
    license = licenses.mit;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
