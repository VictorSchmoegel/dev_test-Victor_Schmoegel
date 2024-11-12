#TODO Configure o Dockerfile

# Usando uma imagem base do Node.js
FROM node:18

# Define o diretório de trabalho dentro do contêiner
WORKDIR /src
# Copia o package.json e o package-lock.json (se existir)
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o restante do código da aplicação para o contêiner
COPY . .

# Compila o código TypeScript para JavaScript
RUN npm run build

# Expõe a porta que a aplicação vai utilizar
EXPOSE 3000

# Define a variável de ambiente para o Node
ENV NODE_ENV=production

# Comando para iniciar a aplicação
CMD ["npm", "start"]
