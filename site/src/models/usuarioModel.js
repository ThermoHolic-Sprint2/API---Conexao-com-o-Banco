var database = require("../database/config")

function listar() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM usuario;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function entrar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT * FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}
var NOME_EMPRESA = "";

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrarEmpresa(nome, email, cnpj) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, cnpj);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO Empresa (Nome, Email, CNPJ) VALUES ('${nome}', '${email}', '${cnpj}');
    `;

    console.log("Executando a instrução SQL: \n" + instrucao);
    // localStorage.setItem("idEmpresateste", get_idEmpresa());
    // localStorage.ID_EMPRESA_TESTE =  get_idEmpresa();
    return database.executar(instrucao);
}

function cadastrarUsuario(nome, email, tell, cpf, senha, codEmp) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, tell, cpf, senha, codEmp);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    // get_idEmpresa(idEmpresa);

    var instrucao = `
        INSERT INTO Usuario (Nome, Email, Celular, CPF, Senha, TipoUsuario, fkEmpresaU) VALUES ('${nome}', '${email}', '${tell}', '${cpf}', '${senha}', 'Funcionário', ${codEmp});
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
    // console.log("Executando a instrução SQL: \n" + instrucao);
    // return database.executar(idEmpresa);
    
}

function get_idEmpresa(NOME_EMPRESA){
    // console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, tell, cpf, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    // var instrucao = `
    //     INSERT INTO Usuario (Nome, Email, Celular, CPF, Senha, TipoUsuario, fkEmpresaU) VALUES ('${nome}', '${email}', '${tell}', '${cpf}', '${senha}', 'Administrador', '');
    // `;

    var idEmpresa = `
    SELECT IdEmpresa FROM empresa WHERE Nome = '${NOME_EMPRESA}'
    `;
    console.log("Executando a instrução SQL: \n" + idEmpresa);
    return database.executar(idEmpresa);

    // console.log("Executando a instrução SQL: \n" + instrucao);
    // return database.executar(idEmpresa); 
}

module.exports = {
    entrar,
    cadastrarEmpresa,
    cadastrarUsuario,
    get_idEmpresa,
    listar,
};
