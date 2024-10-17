// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TiposValor {
    bool public booleano; // If I changed booleano to public, the compiler will create getBooleano function automatically
    int256 public numeroInteiro = -42; // can be positive or negative
    uint public numeroIntNaoNegativo = 32; 
    int public numeroInt = 256;
    address  payable enderecoConta; /* address to receive and send */
    address public enderecoSmartContract; /* address of smart contract */
    address public endereco;
    bytes32 public matrizDeBytes;

    enum Status { Pendente, Aprovado, Rejeitado } // status of a interation with contract
    Status public status;
    Status public statusPadrao = Status.Pendente;


    function setBooleano(bool _booleano) public {
        booleano = _booleano;
    }

/*
    function getMaxUint256() public pure returns (uint256) {
        return type(uint256).max;
    }

    function getMinInt256() public pure returns (int256) {
        return type(int256).min;
    }

    function getMaxInt256() public pure returns (int256) {
        return type(int256).max;
    }
*/

    function setNumeroInteiro(int256 _numeroInteiro) public {
        numeroInteiro = _numeroInteiro;
    }

    function setNumeroInteiroNaoNegativo(uint256 _numeroIntNaoNegativo) public {
        numeroIntNaoNegativo = _numeroIntNaoNegativo;
    }

    function setEndereco(address _endereco) public {
        endereco = _endereco;
    }

    function getBalancoEndereco() public view returns(uint256) {
        return endereco.balance;
    }

    function getBalancoEndereco(address _endereco) public view returns(uint256) {
        return _endereco.balance;
    }

    function setStatus(Status _status) public {
        status = _status;
    }
}
