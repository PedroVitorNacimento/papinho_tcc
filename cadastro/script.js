// Obtém os elementos do formulário e os campos de entrada pelos seus IDs
const form = document.getElementById("form");
const username = document.getElementById("username");
const email = document.getElementById("email");
const password = document.getElementById("password");
const passwordConfirmation = document.getElementById("password-confimation");

// Adiciona um ouvinte de evento para quando o formulário for enviado (submit)
form.addEventListener("submit", (event) => {
  event.preventDefault(); // Impede o envio do formulário para validar os campos primeiro
  checkForm(); // Chama a função para verificar se todos os campos estão corretos
});

// Adiciona ouvintes de evento para o campo de e-mail, nome de usuário, senha e confirmação de senha
// Esses eventos serão disparados quando o usuário sair de cada campo (evento 'blur')
email.addEventListener("blur", () => {
  checkInputEmail(); // Chama a função para verificar se o campo de e-mail está correto
});

username.addEventListener("blur", () => {
  checkInputUserName(); // Chama a função para verificar se o nome de usuário está correto
});

password.addEventListener("blur", () => {
  checkInputSenha(); // Chama a função para verificar se a senha está correta
});

passwordConfirmation.addEventListener("blur", () => {
  checkInputSenhaigual(); // Chama a função para verificar se a confirmação de senha está correta
});

// Função para validar o campo do nome de usuário
function checkInputUserName() {
  const usernameValue = username.value; // Obtém o valor do campo de nome de usuário

  if (usernameValue === "") {
    // Verifica se o campo está vazio
    errorInput(username, "Digite seu nome!!"); // Exibe uma mensagem de erro
  } else {
    const formItem = username.parentElement; // Obtém o elemento pai do campo (div.form-content)
    formItem.className = "form-content"; // Remove qualquer classe de erro e redefine a classe padrão
  }
}

// Função para validar o campo de e-mail
function checkInputEmail() {
  const emailValue = email.value.trim(); // Obtém o valor do campo de e-mail e remove espaços extras

  if (emailValue === "") {
    // Verifica se o campo de e-mail está vazio
    errorInput(email, "Digite um email valido"); // Exibe uma mensagem de erro
  } else {
    const formItem = email.parentElement; // Obtém o elemento pai do campo
    formItem.className = "form-content"; // Remove qualquer classe de erro e redefine a classe padrão
  }
}

// Função para validar o campo de senha
function checkInputSenha() {
  const passwordValue = password.value.trim(); // Obtém o valor da senha e remove espaços extras
  if (passwordValue === "") {
    // Verifica se a senha está vazia
    errorInput(password, "Digite uma senha valida!"); // Exibe uma mensagem de erro
  } else if (passwordValue.length < 8) {
    // Verifica se a senha tem pelo menos 8 caracteres
    errorInput(password, "A senha deve ter no mínimo 8 caracteres"); // Exibe uma mensagem de erro
  } else {
    const formItem = password.parentElement; // Obtém o elemento pai do campo
    formItem.className = "form-content"; // Remove qualquer classe de erro e redefine a classe padrão
  }
}

// Função para validar se a confirmação de senha é igual à senha
function checkInputSenhaigual() {
  const passwordValue = password.value; // Obtém o valor da senha
  const ConfirmationPasswordValue = passwordConfirmation.value; // Obtém o valor da confirmação de senha

  if (ConfirmationPasswordValue !== passwordValue) {
    // Verifica se as senhas não são iguais
    errorInput(passwordConfirmation, "As senhas não são iguais"); // Exibe uma mensagem de erro
  } else if (ConfirmationPasswordValue === "") {
    // Verifica se o campo de confirmação de senha está vazio
    errorInput(passwordConfirmation, "Confirme a senha !!"); // Exibe uma mensagem de erro
  } else {
    const formItem = password.parentElement; // Obtém o elemento pai da senha
    formItem.className = "form-content"; // Remove qualquer classe de erro e redefine a classe padrão
  }
}

// Função que verifica todos os campos do formulário
function checkForm() {
  checkInputUserName(); // Verifica o campo de nome de usuário
  checkInputEmail(); // Verifica o campo de e-mail
  checkInputSenha(); // Verifica o campo de senha
  checkInputSenhaigual(); // Verifica o campo de confirmação de senha

  const formItems = form.querySelectorAll(".form-content"); // Obtém todos os elementos com a classe "form-content"
  const isValid = [...formItems].every((item) => {
    return item.className === "form-content"; // Verifica se todos os campos têm a classe "form-content", ou seja, estão sem erros
  });

  if (isValid) {
    // Se todos os campos forem válidos (sem erro)
    alert("Cadastro realizado com sucesso!"); // Exibe uma mensagem de sucesso
  }

  //daqui para baixo codigo do chat gpt para requisições

  const formData = new FormData(form); //pega os dados do formulario

  $.ajax({
    url: "login_back.php", //arquivo que vai receber os dados
    type: "post", //metodo de envio
    data: formData, // dados do formulario
    processData: false, //impede a conversão de dados para string
    contetType: false, //imped que o jquery defina o tipo de conteudo
    success: function (response) {
      console.log(response); //exibe a resposta do servidor no console
      alert("Cadastro realizado com sucesso !!"); // alerta de sucesso
    },
    error: function (xhr, status, error) {
      //manipula erros se existirem
      console.log(error); //exibe o erro no console
      alert("houve um erro ao cadastrar o usuario");
    },
  });
}

// Função para exibir mensagens de erro nos campos
function errorInput(input, message) {
  const formItem = input.parentElement; // Obtém o elemento pai do campo
  const textMessage = formItem.querySelector("a"); // Obtém o elemento <a> onde a mensagem de erro será exibida

  textMessage.innerText = message; // Define a mensagem de erro no elemento <a>

  formItem.className = "form-content error"; // Adiciona a classe "error" para estilizar o campo como inválido
}
