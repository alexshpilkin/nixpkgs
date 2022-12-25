{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, click
, colorlog
, gitpython
, ruamel-yaml
, pluggy
, pyelftools
, pytablewriter
, pytest
, pyyaml
}:

let
  pname = "riscv_isac";
  version = "0.16.1";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0z8r490n4g1yxgjrvify9m6zb6hg7ygl9c4qixqgbjy8xbgyj76x";
  };

  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [
    click
    colorlog
    gitpython
    ruamel-yaml
    pluggy
    pyelftools
    pytablewriter
    pyyaml
  ];
  checkInputs = [ pytest ];

  # pytest: https://github.com/riscv-software-src/riscv-isac/issues/64
  postPatch = ''
    sed -Ei 's/^(pyelftools)==.*/\1/; /pytest/d' riscv_isac/requirements.txt
  '';
  checkPhase = "pytest";

  meta = with lib; {
    homepage = "https://github.com/riscv-software-src/riscv-isac";
    description = "RISC-V ISA coverage extraction tool";
    license = licenses.bsd3;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
