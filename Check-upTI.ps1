<#
.SYNOPSIS
    Script de Check-up de TI - Verifica o status de conexão de dispositivos de rede

.DESCRIPTION
    Este script PowerShell testa a conectividade de dispositivos importantes da rede
    (Roteador, Internet e Impressora) e gera um relatório em HTML com os resultados.
    O relatório mostra o status de cada dispositivo em verde (ONLINE) ou vermelho (OFFLINE).

.PARAMETER Nenhum
    Este script não aceita parâmetros.

.EXAMPLE
    .\Check-upTI.ps1
    
.OUTPUT
    Gera um arquivo HTML (Relatorio_Rede.html) na Desktop do usuário

.NOTES
    Autor: TI
    Data de Criação: 22/04/2026
    Versão: 1.0
    
    Requisitos:
    - PowerShell 3.0 ou superior
    - Acesso à rede para testar conexões
    - Permissão de escrita na pasta Desktop

.LINK
    https://github.com/seu-usuario/check-up-ti
#>

# ============================================================================
# CONFIGURAÇÕES
# ============================================================================

# IP da impressora na rede
$IP_IMPRESSORA = "192.168.1.50"

# Caminho onde o relatório será salvo
$CaminhoArquivo = "$env:USERPROFILE\Desktop\Relatorio_Rede.html"

# ============================================================================
# FUNÇÕES
# ============================================================================

<#
.SYNOPSIS
    Testa a conectividade de um IP e retorna uma linha HTML com o status

.DESCRIPTION
    Realiza um ping em um endereço IP e retorna uma linha formatada de tabela HTML
    com o nome do dispositivo e seu status (ONLINE ou OFFLINE)

.PARAMETER IP
    Endereço IP do dispositivo a ser testado

.PARAMETER Nome
    Nome descritivo do dispositivo para exibição no relatório

.EXAMPLE
    Get-StatusHTML -IP "192.168.1.1" -Nome "Roteador"

.OUTPUT
    String com linha HTML da tabela formatada
#>
function Get-StatusHTML {
    param(
        [Parameter(Mandatory=$true)]
        [string]$IP,
        
        [Parameter(Mandatory=$true)]
        [string]$Nome
    )
    
    # Testa a conexão com o IP
    $Status = Test-Connection -ComputerName $IP -Count 1 -Quiet
    
    if ($Status) {
        # Retorna linha HTML com status ONLINE em verde
        return "<tr><td>$Nome</td><td style='color:green;'><b>ONLINE</b></td></tr>"
    } else {
        # Retorna linha HTML com status OFFLINE em vermelho
        return "<tr><td>$Nome</td><td style='color:red;'><b>OFFLINE</b></td></tr>"
    }
}

# ============================================================================
# CRIANDO O CONTEÚDO DO HTML
# ============================================================================

# Define o cabeçalho HTML com estilos CSS
$Header = "<html><head><style>body{font-family:sans-serif;} table{border-collapse:collapse;width:300px;} td,th{border:1px solid #ddd;padding:8px;}</style></head><body>"

# Define o título do relatório com o usuário logado
$Titulo = "<h2>Check-up de TI - @$(whoami)</h2>"

# Define o início da tabela HTML
$TabelaInicio = "<table><tr><th>Serviço</th><th>Status</th></tr>"

# Testa cada dispositivo e coleta os resultados
$Resultados = Get-StatusHTML -IP "192.168.1.1" -Nome "Roteador (Gateway)"
$Resultados += Get-StatusHTML -IP "8.8.8.8" -Nome "Internet"
$Resultados += Get-StatusHTML -IP $IP_IMPRESSORA -Nome "Impressora"

# Define o fechamento da tabela e do documento HTML
$TabelaFim = "</table></body></html>"

# ============================================================================
# GERANDO O ARQUIVO
# ============================================================================

# Junta todos os componentes do HTML
$HTML_Final = $Header + $Titulo + $TabelaInicio + $Resultados + $TabelaFim

# Salva o arquivo HTML com codificação UTF-8
$HTML_Final | Out-File -FilePath $CaminhoArquivo -Encoding utf8

# Exibe mensagem de sucesso
Write-Host "Relatório gerado com sucesso em: $CaminhoArquivo" -ForegroundColor Green
