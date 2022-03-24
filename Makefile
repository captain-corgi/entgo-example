go := ~/go-1.18rc1-arm/bin/go

all: tidy build run clean

build:
	@$(go) build -o entgo-example cmd/entgo-example/main.go
run:
	@./entgo-example
clean:
	@rm entgo-example

tidy:
	@$(go) mod tidy
	@$(go) mod vendor

install:
	$(go) install entgo.io/ent/cmd/ent@latest

# Some example
create-user:
	$(go) run entgo.io/ent/cmd/ent init User
generate-user:
	$(go) generate ./ent