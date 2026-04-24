# 🤝 Guia de Contribuição

Obrigado por considerar contribuir para o **Check-up de TI**! Este documento fornece diretrizes e instruções para tornar o processo de contribuição simples e efetivo.

## 📋 Código de Conduta

Este projeto e sua comunidade se comprometem a fornecer um ambiente acolhedor e respeitoso para todos. Esperamos que todos os contribuintes sigam nosso código de conduta baseado em respeito mútuo e inclusão.

## 🐛 Reportando Bugs

Antes de criar um relatório de bug, verifique se o problema já foi relatado. Se você encontrar um bug:

1. **Use um título descritivo** para o issue
2. **Descreva as etapas exatas** que reproduzem o problema
3. **Forneça exemplos específicos** para demonstrar as etapas
4. **Descreva o comportamento observado** e explique qual seria o comportamento esperado
5. **Inclua screenshots** se relevante
6. **Mencione sua versão do Windows e PowerShell**

### Template de Bug Report

```markdown
**Descrição do Bug:**
[Descrição clara do bug]

**Passos para Reproduzir:**
1. [Primeiro passo]
2. [Segundo passo]
3. [...]

**Comportamento Esperado:**
[O que deveria acontecer]

**Comportamento Observado:**
[O que realmente acontece]

**Ambiente:**
- Windows: [versão]
- PowerShell: [versão]
- Versão do Script: [versão]

**Screenshots/Logs:**
[Se aplicável]
```

## 💡 Sugestões de Melhoria

Sugestões para melhorias são sempre bem-vindas! Ao propor uma melhoria:

1. **Use um título descritivo**
2. **Forneça uma descrição detalhada** da melhoria sugerida
3. **Liste exemplos concretos** para demonstrar os passos
4. **Explique por que essa melhoria seria útil**
5. **Liste possíveis alternativas**

### Template de Feature Request

```markdown
**Descrição da Feature:**
[Descrição clara]

**Motivação e Contexto:**
[Por que isso é uma boa ideia?]

**Possível Implementação:**
[Ideias de como implementar]

**Alternativas Consideradas:**
[Outras formas de resolver o mesmo problema]

**Contexto Adicional:**
[Screenshots, exemplos, referências, etc]
```

## 🔄 Enviando Pull Requests

### Prerequisitos

- PowerShell 3.0+
- Windows 7+
- Git instalado e configurado
- GitHub Desktop ou Git CLI

### Processo de PR

1. **Fork o repositório** e clone localmente

```bash
git clone https://github.com/seu-usuario/check-up-ti.git
cd check-up-ti
```

2. **Crie uma branch** para sua feature/fix

```bash
git checkout -b feature/sua-feature-incrivel
```

Use nomes descritivos:
- `feature/nome-descritivo` para novas features
- `fix/nome-descritivo` para correções
- `docs/nome-descritivo` para documentação

3. **Faça suas mudanças** e **teste localmente**

```powershell
# Teste o script
.\\Check-upTI.ps1

# Verifique a sintaxe
Test-Path -Path "Check-upTI.ps1"
```

4. **Commit com mensagens descritivas**

```bash
git commit -m "Descrição clara do que foi feito"
```

Boas práticas para commits:
- Use imperativos ("Adiciona" em vez de "Adicionado")
- Primeira linha até 50 caracteres
- Referencia issues quando apropriado: `Closes #123`
- Seja específico e descritivo

5. **Push para sua fork**

```bash
git push origin feature/sua-feature-incrivel
```

6. **Abra um Pull Request** no GitHub

No PR, forneça:
- Descrição clara das mudanças
- Link para issue relacionada (se houver)
- Screenshots/exemplos se aplicável
- Checklist de testes realizados

### Template de PR

```markdown
## Descrição
[Descrição clara do que foi mudado]

## Tipo de Mudança
- [ ] Bug fix (correção que não quebra funcionalidade)
- [ ] Nova feature (funcionalidade que não quebra código existente)
- [ ] Breaking change (correção ou feature que quebra funcionalidade)
- [ ] Atualização de documentação

## Como foi testado?
[Descreva os testes que realizou]

## Checklist
- [ ] Meu código segue o estilo do projeto
- [ ] Testei localmente
- [ ] Atualizei a documentação se necessário
- [ ] Minha mudança não quebra nenhum teste existente

## Issues Relacionadas
Closes #[número da issue]
```

## ✍️ Styleguide para PowerShell

### Convenções de Código

```powershell
# Use CamelCase para variáveis
$MeuaVariavel = "valor"

# Use PascalCase para funções
function Get-StatusHTML {
    param(
        [Parameter(Mandatory=$true)]
        [string]$IP
    )
    # corpo
}

# Sempre use comentários descritivos
# Use # para comentários de linha simples
<#
    Use este formato para comentários de bloco
    ou documentação de função
#>

# Mantenha linhas com no máximo 100 caracteres
$MuitoComplicado = "Quebre " + "linhas " + `
    "longas " + "assim"
```

### Documentação

Toda função nova deve ter documentação PSDoc:

```powershell
<#
.SYNOPSIS
    Descrição breve da função

.DESCRIPTION
    Descrição mais detalhada do que a função faz

.PARAMETER NomeParametro
    Descrição do parâmetro

.EXAMPLE
    Exemplo de uso da função

.OUTPUT
    Tipo e descrição da saída
#>
function Get-MeuaFuncao {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Parametro
    )
    # implementação
}
```

## 📖 Guia de Documentação

Se está atualizando a documentação:

1. Use Markdown para `.md` files
2. Mantenha um topo de página com índice
3. Use cabeçalhos hierárquicos apropriados
4. Adicione exemplos práticos
5. Mantenha a documentação sincronizada com o código

## 🧪 Testes

Antes de submeter um PR:

1. **Teste a sintaxe PowerShell**
   ```powershell
   [System.Management.Automation.PSParser]::Tokenize(
       (Get-Content 'Check-upTI.ps1'), [ref]$null
   )
   ```

2. **Execute o script localmente**
   ```powershell
   .\\Check-upTI.ps1
   ```

3. **Verifique se o HTML foi gerado**
   ```powershell
   Test-Path "$env:USERPROFILE\\Desktop\\Relatorio_Rede.html"
   ```

4. **Abra o HTML em um navegador** e verifique a formatação

## 📝 Processo de Review

Cada PR passará por:

1. ✅ Verificação automática (sintaxe, linhas, etc)
2. ✅ Revisão manual do código
3. ✅ Testes funcionais
4. ✅ Aprovação e merge

Seja paciente e respeitoso durante reviews. Os comentários são sobre o código, não sobre você!

## 🎓 Aprenda com o Projeto

- Explore os issues abertos
- Leia a documentação do código
- Veja PRs anteriores para entender o padrão
- Pergunte se tiver dúvidas!

## 📞 Perguntas?

- Abra uma [Discussion](https://github.com/seu-usuario/check-up-ti/discussions)
- Consulte a [Wiki](https://github.com/seu-usuario/check-up-ti/wiki)
- Procure por issues similares

## ✨ Agradecimentos Especiais

Obrigado a todos que contribuem para melhorar este projeto! Suas contribuições significam muito. 🙌

---

**Último atualizado:** 22 de abril de 2026
