{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    #cargo # Downloads your Rust project's dependencies and builds your project
    #clippy # A bunch of lints to catch common mistakes and improve your Rust code
    lldb # A next-generation high-performance debugger
    # rocmPackages_5.llvm.lld
    rocmPackages.llvm.lld
    llvmPackages.bintools
    #rust-analyzer # Lsp for rust
    #rustc # Compiler for rust
    #rustfmt # Formatter for rust language
    pkg-config
    openssl
    libgudev
    pkg-config
    libudev-zero
    haskellPackages.lzma
    # rustup # The Rust toolchain installer
  ];
  shellHook = ''
    echo "Environment is ready" | ${pkgs.lolcat}/bin/lolcat;
    '';
}
