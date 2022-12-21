#!/bin/bash

go install "github.com/cweill/gotests/gotests@latest"
go install "github.com/fatih/gomodifytags@latest"
go install "github.com/josharian/impl@latest"
go install "github.com/haya14busa/goplay/cmd/goplay@latest"
go install "github.com/go-delve/delve/cmd/dlv@latest"
go install "honnef.co/go/tools/cmd/staticcheck@latest"
go install "golang.org/x/tools/gopls@latest"
go install "golang.org/x/tools/cmd/goimports@latest"
go install "golang.org/x/tools/cmd/gorename@latest"
go install "golang.org/x/tools/cmd/guru@latest"