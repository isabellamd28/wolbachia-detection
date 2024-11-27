# Avaliação de qualidade das leituras com FastQC
fastqc SRRXXXXXXX.fastq

#O que é o FastQC? O FastQC é uma ferramenta amplamente usada para verificar a qualidade de arquivos de sequenciamento em formato .fastq. O FastQC gera relatórios detalhados sobre a qualidade dos dados de sequenciamento, identificando potenciais problemas (como baixos níveis de qualidade em algumas posições da leitura, presença de contaminantes ou sequências adaptadoras, etc.).

O que o comando faz?

O comando fastqc avalia o arquivo de sequenciamento fornecido (SRRXXXXXXX.fastq) e gera um relatório de qualidade sobre o arquivo FASTQ. O arquivo .fastq é um formato comum para dados de sequenciamento, que contém tanto as sequências de nucleotídeos quanto as informações de qualidade associadas a cada base sequenciada.
O resultado do fastqc inclui gráficos e tabelas para examinar aspectos como:
Qualidade das bases ao longo das leituras.
Distribuição do comprimento das leituras.
Contaminação de sequências adaptadoras.
Frequência de GC nas sequências.
Características de duplicação, etc.
Exemplo de uso: Quando você usa o comando acima, ele gera relatórios que ajudam a identificar se há problemas na qualidade das leituras sequenciadas que precisam ser corrigidos antes de seguir para as etapas de processamento de dados.

# Limpeza e corte de sequências de baixa qualidade com Trim Galore
trim_galore --fastqc -q 25 --trim-n --max_n 0 -j 1 --length 18 --dont_gzip SRRXXXXXXX.fastq

#O que é o Trim Galore? O Trim Galore é uma ferramenta usada para realizar o corte (trimming) de sequências, ou seja, para remover bases de baixa qualidade e/ou sequências de adaptadores que podem estar presentes nos dados de sequenciamento. Essa etapa é crucial para garantir que apenas sequências de alta qualidade sejam usadas nas análises subsequentes.

Explicação dos parâmetros do comando:

--fastqc: Esse parâmetro instrui o Trim Galore a rodar o FastQC automaticamente após o processamento do arquivo de entrada, para verificar a qualidade das sequências resultantes após o corte.

-q 25: Esse parâmetro define um limite de qualidade para os cortes. Aqui, qualquer base com qualidade inferior a 25 será cortada. A qualidade é geralmente avaliada em uma escala Phred, onde valores mais altos indicam maior precisão. Bases com qualidade inferior a 25 podem ser descartadas para evitar que influenciem negativamente na análise.

--trim-n: Esse parâmetro faz com que qualquer sequência contendo bases "N" (bases desconhecidas) seja cortada. Isso é útil porque bases "N" representam falhas de sequenciamento e podem prejudicar a interpretação dos dados.

--max_n 0: Aqui, estamos indicando que não permitimos nenhuma base "N" nas sequências. Caso algum fragmento contenha "N", ele será descartado. Esse parâmetro ajuda a garantir que as leituras limpas não contenham informações incompletas.

-j 1: Este parâmetro indica o número de threads que o Trim Galore deve usar para realizar o processamento. O valor 1 significa que será usado apenas um núcleo de CPU. Para aumentar a velocidade do processamento, pode-se aumentar esse valor se o sistema tiver múltiplos núcleos.

--length 18: Especifica o comprimento mínimo das sequências após o corte. Se a sequência tiver menos de 18 bases depois do corte, ela será descartada. Esse parâmetro ajuda a evitar que sequências muito curtas, que provavelmente têm pouca informação útil, sejam incluídas na análise final.

--dont_gzip: Impede que o Trim Galore compacte o arquivo de saída. Por padrão, o Trim Galore comprime os arquivos processados usando gzip, mas com este parâmetro, o arquivo de saída será gerado no formato FASTQ sem compressão.

SRRXXXXXXX.fastq: Este é o nome do arquivo de entrada que será processado pelo Trim Galore. O arquivo .fastq contém as leituras de sequenciamento que estão sendo analisadas.


