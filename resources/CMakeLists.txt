cmake_minimum_required(VERSION 3.12)

project(ModernCV NONE)
include(UseLATEX)

add_latex_document(
    moderncv.tex
    FORCE_PDF
)
