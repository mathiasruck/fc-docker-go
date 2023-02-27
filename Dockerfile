FROM golang as builder

WORKDIR /go/fullCycle

COPY go-src/fullCycle.go .

RUN go build fullCycle.go

FROM scratch

WORKDIR /go/fullCycle

COPY --from=builder /go/fullCycle/fullCycle .

ENTRYPOINT ["./fullCycle"]