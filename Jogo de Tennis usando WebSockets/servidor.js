const express = require('express');
const http = require('http');
const socketIO = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socketIO(server);

// Armazena as conexões dos jogadores
const jogadores = new Set();

// Função para enviar dados para todos os jogadores conectados
function enviarDadosParaJogadores(dados) {
  io.emit('dados', dados);
}

// Quando um jogador se conecta
io.on('connection', (socket) => {
  console.log('Novo jogador conectado!');

  // Adiciona o jogador à lista de jogadores
  jogadores.add(socket);

  // Quando o servidor recebe uma mensagem de um jogador
  socket.on('mensagem', (mensagem) => {
    console.log('Mensagem recebida do jogador:', mensagem);

    // Reencaminha a mensagem para todos os jogadores
    enviarDadosParaJogadores(mensagem);
  });

  // Quando um jogador desconecta
  socket.on('disconnect', () => {
    console.log('Jogador desconectado!');

    // Remove o jogador da lista de jogadores
    jogadores.delete(socket);
  });
});

server.listen(8080, () => {
  console.log('Servidor WebSocket em execução na porta 8080.');
});

