#!/bin/bash

FUPAD_INSTALLER=$1
MINGW_ARCHIVE=$2

TMPDIR=`mktemp -d -p ./`
ISOROOT=${TMPDIR}/isoRoot

mkdir -p ${ISOROOT}

function extractFuPad()
{
    # FuPad構成ファイルの抽出
    EXTRA_TMPDIR=${TMPDIR}/extra
    mkdir -p ${EXTRA_TMPDIR} && \
    msiextract -C ${EXTRA_TMPDIR} ${FUPAD_INSTALLER} && \
    mv ${EXTRA_TMPDIR}/Program\ Files/FuPad* ${ISOROOT}/

}

function extractMinGw()
{
    # mingwの抽出
    7z x ${MINGW_ARCHIVE} -o${ISOROOT}
}

function mkFuPadIso()
{
    # FuPadのisoの作成
    mkisofs -o FuPadPortable.iso -J -R -V FuPadPortable ${ISOROOT}
}

function cleanUp()
{
    # 一時ファイルの削除
    rm -rf ${TMPDIR}
}

function printBatchTmp()
{
    cat << EOS
@echo off
set MINGWPATH=%~dp0%mingw64\bin
set PATH=%MINGWPATH%;%PATH%
set FUPADEXE=%~dp0%###FUPAD_EXE###
rem echo %FUPADEXE%
%FUPADEXE%
EOS
}

function mkBatch()
{
    FUPADEXE=`find ${ISOROOT} -name "FuPad_for_*.exe" | sed s#^${ISOROOT}##`
    printBatchTmp | sed -e "s@###FUPAD_EXE###@${FUPADEXE}@" > ${ISOROOT}/runFuPadPortable.bat
}

extractFuPad && \
extractMinGw && \
mkBatch && \
mkFuPadIso && \
cleanUp