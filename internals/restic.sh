RESTIC_VERSION="efc5d0699a86e81fc6c684c06d51d55808aa80b0"
RESTIC_CHECKSUM="0fb7bc0ae37f6d0aaed4f0cc6de39f9f"
RESTIC_LINK="https://github.com/restic/restic/archive/${RESTIC_VERSION}.tar.gz"

download_restic() {
    download_file $RESTIC_LINK $RESTIC_CHECKSUM restic-${RESTIC_VERSION}.tar.gz
}

extract_restic() {
    if [ ! -d "restic-${RESTIC_VERSION}" ]; then
        echo "[+] extracting: restic-${RESTIC_VERSION}"
        tar -xf ${DISTFILES}/restic-${RESTIC_VERSION}.tar.gz -C .
    fi
}

prepare_restic() {
    echo "[+] preparing restic"
}

compile_restic() {
    echo "[+] compiling restic"
    go run build.go
}

install_restic() {
    echo "[+] installing restic"
    cp -a restic "${ROOTDIR}/usr/bin/"
}

build_restic() {
    pushd "${WORKDIR}/restic-${RESTIC_VERSION}"

    prepare_restic
    compile_restic
    install_restic

    popd
}

registrar_restic() {
    DOWNLOADERS+=(download_restic)
    EXTRACTORS+=(extract_restic)
}

registrar_restic

