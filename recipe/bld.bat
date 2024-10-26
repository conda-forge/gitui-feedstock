@echo on

set CARGO_PROFILE_RELEASE_STRIP=symbols
set CARGO_PROFILE_RELEASE_LTO=fat

:: dump licenses
cargo-bundle-licenses ^
    --format yaml ^
    --output "%SRC_DIR%\THIRDPARTY.yml" ^
    || exit 1

:: build
cargo install --locked ^
    --root "%PREFIX%" ^
    --path . ^
    --no-track ^
    || exit 1
