# 🔍 Check-up de TI - Network Status Monitor

![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue)
![Windows](https://img.shields.io/badge/Windows-10%2B-green)
![License](https://img.shields.io/badge/License-MIT-yellow)
![Status](https://img.shields.io/badge/Status-Active-brightgreen)

> Um script PowerShell profissional e eficiente para monitorar em tempo real o status de dispositivos críticos da rede, gerando relatórios visuais em HTML.

## 📋 Descrição

O **Check-up de TI** automatiza o monitoramento de conectividade de equipamentos essenciais na rede corporativa. Com um simples clique, você obtém um relatório em HTML mostrando o status de cada dispositivo com cores intuitivas:

- 🟢 **ONLINE** (Verde) - Dispositivo respondendo normalmente
- 🔴 **OFFLINE** (Vermelho) - Dispositivo indisponível ou sem conexão

## ✨ Características

- ✅ Teste automático de conectividade via PING
- ✅ Relatório visual em HTML com cores diferenciadas
- ✅ Fácil customização de IPs e dispositivos
- ✅ Código bem documentado e profissional
- ✅ Sem dependências externas
- ✅ Execução rápida e leve
- ✅ Salva relatório automaticamente na Desktop

## 🎯 Dispositivos Monitorados

Por padrão, o script monitora:

| Dispositivo | IP | Descrição |
|-------------|-----|----------|
| Roteador | 192.168.1.1 | Gateway da rede local |
| Internet | 8.8.8.8 | Conectividade externa (Google DNS) |
| Impressora | 192.168.1.50 | Dispositivo de impressão |

## 📋 Requisitos

- **Sistema Operacional:** Windows 7, 8, 10, 11 ou Server 2008+
- **PowerShell:** Versão 3.0 ou superior
- **Permissões:** Acesso de leitura para pasta Desktop
- **Rede:** Conectividade com os dispositivos a serem testados

## 🚀 Início Rápido

### Opção 1: Clique Duplo (Mais Fácil)

Basta clicar duas vezes no arquivo **`executar.bat`** e pronto!

### Opção 2: PowerShell

```powershell
# Abra o PowerShell e execute:
.\Check-upTI.ps1
```

### Opção 3: Command Prompt

```cmd
powershell -ExecutionPolicy Bypass -File Check-upTI.ps1
```

## 📊 Resultado

Após a execução, o script gera um arquivo `Relatorio_Rede.html` na sua Desktop.

**Abra em qualquer navegador para visualizar:**

```
C:\Users\[SeuUsuário]\Desktop\Relatorio_Rede.html
```

### Exemplo de Relatório Gerado

```html
Check-up de TI - @seu-usuario

┌─────────────────┬─────────┐
│ Serviço         │ Status  │
├─────────────────┼─────────┤
│ Roteador        │ ONLINE  │
│ Internet        │ ONLINE  │
│ Impressora      │ OFFLINE │
└─────────────────┴─────────┘
```

## 🔧 Personalização

Você pode facilmente adicionar ou modificar dispositivos editando o script:

```powershell
# Arquivo: Check-upTI.ps1
# Linhas ~75-77

$Resultados = Get-StatusHTML -IP "192.168.1.1" -Nome "Roteador (Gateway)"
$Resultados += Get-StatusHTML -IP "8.8.8.8" -Nome "Internet"
$Resultados += Get-StatusHTML -IP "192.168.1.50" -Nome "Impressora"
$Resultados += Get-StatusHTML -IP "192.168.1.100" -Nome "Servidor (Novo)"  # Adicione aqui
```

## 📁 Estrutura do Projeto

```
check-up-ti/
├── Check-upTI.ps1          # Script principal
├── executar.bat            # Atalho para executar (clique duplo)
├── README.md               # Esta documentação
├── LICENSE                 # Licença MIT
├── CHANGELOG.md            # Histórico de versões
├── .gitignore              # Arquivos ignorados no Git
└── Relatorio_Rede.html     # Saída do script (gerado)
```

## 🐛 Solução de Problemas

### ❌ "O acesso ao caminho foi negado"

**Causa:** Permissões insuficientes na pasta Desktop

**Solução:**
```powershell
# Execute como Administrador
Run-As Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### ❌ "Test-Connection: Nome de host inválido"

**Causa:** IP incorreto ou dispositivo não existente

**Solução:**
- Verifique o IP correto do dispositivo
- Teste manualmente com: `Test-Connection 192.168.1.1`
- Certifique-se de que está conectado à rede

### ❌ "O script não executa"

**Causa:** Política de execução do PowerShell bloqueada

**Solução:**
```powershell
# Verifique a política atual
Get-ExecutionPolicy

# Altere para permitir scripts locais
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Confirme com: Y
```

## 📚 Documentação do Código

O script está totalmente documentado com:
- **Header PSDoc:** Descrição completa da função
- **Comentários inline:** Explicação de cada seção
- **Parâmetros documentados:** Tipo e propósito
- **Exemplos:** Como usar cada função

Ver seção de funções em `Check-upTI.ps1` para mais detalhes.

## 🔐 Segurança

- ✅ Sem chamadas de rede externa (exceto testes de conectividade)
- ✅ Sem acesso a arquivo do sistema
- ✅ Sem instalação de software adicional
- ✅ Código aberto para auditoria

## 📝 Licença

Este projeto está licenciado sob a **Licença MIT** - veja o arquivo [LICENSE](LICENSE) para detalhes.

## 🤝 Contribuindo

Contribuições são bem-vindas! Para contribuir:

1. Faça um Fork do repositório
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📞 Suporte

- 📧 Issues: Abra uma [Issue](https://github.com/seu-usuario/check-up-ti/issues)
- 💬 Discussões: Participe das [Discussões](https://github.com/seu-usuario/check-up-ti/discussions)

## 📈 Roadmap

- [ ] Suporte a múltiplos perfis de teste
- [ ] Interface gráfica (GUI)
- [ ] Histórico de testes
- [ ] Notificações por email
- [ ] Exportar em PDF

## 👨‍💻 Autor

**Equipe de TI**

---

<div align="center">

**[⬆ Voltar ao Topo](#check-up-de-ti---network-status-monitor)**

✨ Se este projeto foi útil para você, considere dar uma ⭐ no GitHub! ✨

*Última atualização: 22 de abril de 2026*

</div>
