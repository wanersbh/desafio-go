FROM golang:alpine AS builder

# Diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o código fonte para o diretório de trabalho
COPY . .

# Compila o código fonte
RUN go build -o main .

# Cria uma imagem mínima
FROM scratch

# Copiaa o executável compilado da etapa anterior
COPY --from=builder /app/main /app/main

# Define o comando padrão a ser executado
CMD ["/app/main"]