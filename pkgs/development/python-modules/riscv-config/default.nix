{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, cerberus
, ruamel-yaml
, pyyaml
}:

let
  pname = "riscv_config";
  version = "3.5.1";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "1xmq7z54n0wxliq2r8z6qfy2vmcfn57mjxiqiwal8y76x5n3nijk";
  };

  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [ cerberus ruamel-yaml pyyaml ];

  meta = with lib; {
    homepage = "https://github.com/riscv-software-src/riscv-config";
    description = "RISC-V configuration validator";
    license = licenses.bsd3;
    maintainers = with maintainers; [ alexshpilkin ];
    mainProgram = "riscv-config";
  };
}
