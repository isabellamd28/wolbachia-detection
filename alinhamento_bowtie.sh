# Construção do índice de alinhamento com Bowtie
bowtie-build reference.fasta reference_index

#Objetivo: O bowtie-build é utilizado para criar um índice de alinhamento a partir de uma sequência de referência (geralmente um genoma). Esse índice é necessário para que o Bowtie possa realizar o alinhamento de maneira rápida e eficiente.

Explicação dos parâmetros:

reference.fasta: Este é o arquivo de entrada que contém a sequência de referência no formato FASTA. Esse arquivo pode ser o genoma completo de uma bactéria, como Wolbachia, ou qualquer sequência genômica que você deseja usar como referência.
reference_index: Este é o prefixo do arquivo de saída. O Bowtie criará vários arquivos com esse prefixo para representar o índice de alinhamento. O índice gerado é uma estrutura de dados que facilita o alinhamento rápido das leituras contra a sequência de referência. O nome reference_index pode ser qualquer nome de sua escolha.
O que faz o bowtie-build? Ele prepara a sequência de referência (geralmente um genoma) para ser usada no alinhamento de sequências. O índice facilita o alinhamento rápido de múltiplas sequências de leitura contra a referência.


# Alinhamento das sequências contra a referência de Wolbachia
bowtie -f -S -a -v 0 -p 3 -t reference_index sample.fasta > sample.sam 2> sample_bowtie.log

#Este comando realiza o alinhamento das sequências de DNA/RNA contra o índice de referência previamente construído. Vou detalhar os parâmetros usados:

-f: Este parâmetro indica que o arquivo de entrada (neste caso, sample.fasta) está no formato FASTA. O Bowtie pode aceitar diferentes formatos de entrada, e esse parâmetro especifica que as sequências de entrada são fornecidas no formato FASTA, onde cada sequência começa com um > seguido pelo identificador da sequência, e as sequências em si são listadas nas linhas subsequentes.

-S: Este parâmetro diz ao Bowtie para gerar a saída no formato SAM (Sequence Alignment/Map), que é um formato amplamente utilizado para armazenar dados de alinhamento de sequências. O arquivo de saída será um arquivo .sam contendo o alinhamento de cada sequência de leitura no arquivo sample.fasta com a sequência de referência.

-a: Este parâmetro instruirá o Bowtie a relatar todas as possíveis correspondências para uma leitura, ou seja, ele não descartará as leituras que correspondem a mais de uma posição no genoma de referência. Caso não seja especificado, o Bowtie geralmente retorna apenas a melhor correspondência.

-v 0: Esse parâmetro define a tolerância a erros no alinhamento. O valor -v 0 significa que o Bowtie permitirá nenhum erro durante o alinhamento. Ou seja, as leituras devem corresponder exatamente à sequência de referência. Se fosse -v 1, por exemplo, o Bowtie permitiria até um erro de 1 base em cada leitura durante o alinhamento.

-p 3: Este parâmetro especifica o número de threads (núcleos de CPU) que o Bowtie deve usar para realizar o alinhamento. O valor -p 3 indica que o Bowtie usará 3 núcleos para acelerar o processo de alinhamento. Isso é especialmente útil quando se trabalha com grandes volumes de dados.

-t: Este parâmetro instrui o Bowtie a imprimir estatísticas durante o alinhamento, como o tempo de execução e outras informações sobre o processo. Essas estatísticas podem ser úteis para monitorar o progresso e o desempenho do alinhamento.

reference_index: Este é o índice de referência que foi criado no comando anterior com o bowtie-build. O Bowtie usa esse índice para realizar o alinhamento das sequências de entrada contra o genoma de referência.

sample.fasta: Este é o arquivo de entrada contendo as sequências de leitura que você deseja alinhar contra a referência. Ele pode ser um arquivo FASTA contendo as sequências geradas pelo sequenciamento de RNA/DNA.

> sample.sam: O operador > redireciona a saída do comando para o arquivo sample.sam, que conterá o alinhamento das leituras contra a referência. O arquivo SAM inclui informações sobre o alinhamento, como as posições em que as leituras se alinham no genoma de referência, o número de erros permitidos, e a qualidade do alinhamento.

2> sample_bowtie.log: O operador 2> redireciona a saída de erro (stderr) para um arquivo chamado sample_bowtie.log. Esse arquivo de log irá conter informações de diagnóstico ou erros durante o processo de alinhamento, como problemas com o formato do arquivo de entrada, falhas no alinhamento, etc.
