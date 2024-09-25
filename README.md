# KSHVbook
## An encyclopedia focused on KSHV

Kaposi’s sarcoma-associated herpesvirus (KSHV) is a double-stranded DNA virus belonging to the γ-herpesvirus subfamily. Its lifecycle primarily includes latent infection and lytic reactivation, KSHV has the ability to establish a lifelong persistent latent infection as a means of evading the host’s immune surveillance. KSHV is the causative agent of Kaposi’s sarcoma (KS), primary effusion lymphoma (PEL), multicentric Castleman’s disease (MCD), and KSHV inflammatory cytokine syndrome (KICS). 

Since its discovery, research on KSHV has rapidly progressed, but existing platforms lack comprehensiveness and specificity, and they do not provide efficient analysis tools tailored for KSHV. To study KSHV more effectively, we have developed KSHVbook (http://www.kshvbook.com), a specialized information-sharing platform dedicated to KSHV. This platform offers extensive information on gene, coding sequences (CDS), protein-coding. Besides, KSHVbook includes 35,010 transcription factor binding sites (TFBSs), 342,010 KSHV miRNA-target relationship pairs, protein structures predicted by AlphaFold2, qPCR primers, and so on. Notably, we also develop analysis tools for regions, TFBSs, and miRNA target genes to discover previously unknown biological functions of KSHV.

Our platform provides a centralized resource for KSHV research by integrating multiple databases, offering accessible tools and simplifying data acquisition, thereby improve our understanding of KSHV biology. KSHVbook will continue to be updated and more features can be found on the website.

### MATERIALS AND METHODS
#### Basic information of KSHV genes
The KSHVbook obtains the GTF gene annotation and FASTA nucleotide sequences of the KSHV reference genome (NC_009333.1) from the NCBI Nucleotide database.25,26 After organizing these data, we provide detailed information on 86 coding genes, 25 mature miRNAs, and 2 other ncRNAs (Figure 1). The information on coding genes includes the regions of the gene body and the gene coding sequences (CDS), as well as the bases of these regions (Figure 2A). Additionally, amino acid sequences of proteins are provided (Figure 2B). To facilitate users to viewing and downloading the relevant data, KSHVbook has designed an intuitive gene structure browsing interface and sequence download button.

The KSHVbook integrates protein-protein interaction data from BioGRID to confirm potential interactions with KSHV proteins identified by STRING.27 The platform utilizes VirusHound-I to predict viral proteins involved in evading host adaptive immune responses, analyzing the mechanisms of KSHV proteins in immune evasion processes.28 Viral protein amino acid sequences are inputted into TAP to predict their potential as tumor T-cell antigens.29 We use CELLO to calculate the subcellular localization of viral proteins, providing multiple scoring indicators such as extra_score, outer_score, peri_score, inner_score, cyto_score, and most_likely_location, to enhance users’ understanding of protein cellular localization.30 Finally, InterPro is used to identify the conserved domains of proteins, categorizing them into families to help users explore the potential functions of viruses.31

#### Manually gather qPCR primers and gene functions
Accurate qPCR primers are crucial for the detection of quantitative RNA. For reported primers, we provide the literature sources where they have been used, and utilize the Primer3 tool to calculate the primer’s GC content, Tm value, and PCR annealing temperature, ensure that the experiment can accurately detect the gene expression levels.32 We also offer a convenient button to copy the primer sequence. Organizing the functions of genes aids in understanding their roles in the organism. We enhanced the understanding of each gene’s function by reviewing a vast amount of literature related to KSHV genes, detailing their involvement in metabolic pathways and interactions with other biomolecules. This compiled information provides researchers with a valuable reference for their studies.

#### The TFBS in the upstream regulatory region
The KSHVbook uses the sequence scanning method to analyze the TFBSs in the KSHV genome. The TF motifs used come from the JASPAR 2024, including 668 TFs and 773 motifs, which represent the key sequence patterns for TF binding to DNA (Figure 2C).33 We scanned the entire KSHV genome using the FIMO tool from the MEME suite to predict putative TFBSs based on viral DNA sequences and motifs with p-value cutoff of 0.0001.21,34 For the upstream regulatory regions of KSHV genes, we assume that the regions 1,000 and 2,000 base pairs upstream of the transcription start site are regulatory regions, so the TFBSs in these regions are predicted to be TFs regulating the KSHV genes. After calculation, we obtained a total of 35,010 TFBSs for KSHV gene.

#### Protein structure for AlphaFold2
In previous studies, the structures of KSHV proteins were not comprehensively and systematically identified. However, with the continuous introduction of advanced software such as AlphaFold2, the accuracy and reliability of protein structure prediction have been significantly improved.23,24 While AlphaFold2 is primarily used to predict human proteins, the gene translation process of viral proteins like KSHV mainly relies on intracellular mechanisms, making this type of prediction method suitable for KSHV proteins as well. The KSHVbook uses AlphaFold2 to calculate the structures of KSHV proteins. We input the amino acid sequences of 86 KSHV-coded genes and successfully obtained structural information for these proteins (Figure 2D). With the help of the pdbe-molstar tool for visualization on the “KSHV coding gene page” users can visually display the PDB files of the predicted protein structures.

#### The target genes of 25 KSHV miRNAs
The TargetScan is a widely used tool for the identification of miRNA target genes.22 In our database, we acquired the 3’UTR sequences of human genes along with KSHV miRNA sequences.22,35 By employing the principle of base complementarity, we aligned the KSHV miRNA seed sequences with the 3’UTRs of host genes, thereby seeking conserved 8mer, 7mer, and 6mer sites that corresponded to the miRNA seed region. We applied a computational model to score the candidate target genes to assess the likelihood that host genes are regulated by KSHV miRNAs. Under the default threshold conditions, we identified 25 mature KSHV miRNAs targeting 17,972 host genes, establishing a total of 342,010 miRNA-target relationship pairs (Figure 2E).

#### Publication related to KSHV
KSHVbook utilizes NCBI PUBMED to collect academic articles related to KSHV/HHV-8. By employing specific search criteria “Title/ABSTRACT”, and keywords “KSHV” or “HHV-8” or “HHV8” or “Kaposi’s sarcoma-associated herpesvirus”, we effectively retrieved 6,802 publications (update to September 10, 2024), ensuring users have access to the most relevant and up-to-date information in the field (Figure 2F). Each publication we collect undergoes meticulous curation to provide users with essential details for understanding and evaluating its relevance, including PUBMED ID, article title, authors, citation link, journal of publication, and publication year. Our platform takes advantage of the Echarts to provide statistical information on these publications, including the number of relevant publications published each year and the number of publications published by authors.

#### Mutation of KSHV genome
We retrieved KSHV genome sequences larger than 130kb from the NCBI Nucleotide database and obtained a total of 252 records, including Accession ID, nucleotide sequences, genome length, and genome description. We then manually screened genomic sequences between 130kb and 140kb in length, extracted from patient-derived samples while excluding cell lines and BAC strains. In total, 164 KSHV sequences were obtained for genomic mutation analysis. Snippy was used to identify potential mutations in the KSHV genome, and the genomic nucleotide mutations were calculated using NC_009333.1 as the reference genome with other viral sequences (Figure 2G).

#### System design and implementation
The current version of KSHVbook use PostgreSQL 16 (https://www.postgresql.org) development, running on Linux based Nginx server (https://nginx.org). We used flask version 3.0.1 (https://flask.palletsprojects.com) for server-side framework in Python 3.10.13. We designed and built the interactive interface using Bootstrap v5.3.0 (https://v5.bootcss.com) and JQuery v3.7.1 (http://jquery.com). We used ECharts (https://echarts.apache.org) and D3 (https://d3js.org) as a graphical visualization framework, and IGV.js (https://igv.org) is the genome browser framework. We recommend using a modern web browser that supports the HTML5 standard such as Firefox, Google Chrome, Safari, Opera or IE 9.0+ for the best display.

The KSHVbook is freely available to the research community using the web link (http://www.kshvbook.com). Users don’t need to register or log in to access features in the database.

### DISCUSSION
KSHV is the eighth known herpesvirus capable of infecting humans, and it is associated with three malignant tumors, including KS, PEL, and MCD.13 Initial KSHV infection is usually asymptomatic, with the virus remaining in a latent state.44 However, individuals with compromised immune function, such as AIDS patients or organ transplant recipients, are more susceptible to developing KSHV-related malignancies.16,45 While the introduction of cART has reduced the incidence of KSHV-related diseases in AIDS patients, a certain level of risk still remains.44 Immunosuppressants administered to organ transplant recipients to prevent rejection may also exacerbate the development of KSHV-related illnesses. The aforementioned examples demonstrate that viruses can reactivate and induce disease in the presence of immune deficiency or immunosuppression.12 Notably, KSHV is an oncogenic virus that can persistently infect human cells and potentially influence their biological activities, leading to disease development under certain conditions. For example, studies have shown that KSHV may promote the progression of dilated cardiomyopathy, and the detection of KSHV miR-K12-1-5p is associated with poorer prognosis in patients with this condition. Given the potential health risks posed by KSHV, it is essential to accelerate and deepen research on this virus to better understand and address the challenges it presents.47 Since its discovery in 1994, the pathogenic properties and infection mechanisms of KSHV have been gradually revealed.46 However, certain unique characteristics of KSHV, such as the establishment of lifelong infection, stringent control of immune system, and the absence of efficient animal models, have somewhat impeded research progress on KSHV. Therefore, there is an urgent need for an integrated platform that provides KSHV-specific biological information to facilitate advancements in the field.

The NC_009333.1 sequence of KSHV genome isolated from classical KS tumor, has been validated and widely used as a reference sequence for KSHV. It has been compared with genomes such as BC1 and was last updated by NCBI in 2019.3 At present, there is no exhaustive information-sharing platform specifically dedicated to KSHV. Researchers often need to search for the required information that is scattered across multiple databases (such as NCBI Gene, Uniprot, etc.), which do not fully meet user needs. For instance, accessing publications requires visiting PubMed. Obtaining gene sequences entails multiple queries to NCBI Nucleotide or GeneBank. UniProt only provides structures similar to KSHV proteins, and the AlphaFold Protein Structure Database currently does not include predictions for KSHV proteins.18,19,48 Furthermore, users need to read through publications carefully to find qPCR primers. These platforms lack dedicated analytical tools for KSHV, which poses obstacles to exploring new biological functions. Despite being primary data sources, they are not streamlined or efficient for quickly accessing comprehensive information on specific KSHV genes. The establishment of KSHVbook aims to build a data reference platform dedicated solely to KSHV, which integrates a variety of information, including KSHV gene, CDS, amino acid sequences, upstream regulatory regions, TFBSs, and miRNA target genes, and so on. Notably, we have also leveraged the AlphaFold2 model to predict the protein structures of KSHV-coding genes, providing valuable insights for protein interaction and drug discovery. And we will provide AlphaFold3 predictions in the future release. Accurate qPCR primers are essential for the precise quantitative analysis of KSHV gene expression. We have meticulously gathered and organized validated KSHV gene qPCR primers from published literature, along with detailed source information. We have developed new primer sequences that serve as valuable references. Overall, KSHVbook aims to be a concise and efficient reference database for KSHV. It offers convenient gene query functionalities and integrates various bioinformatics analysis tools to facilitate the exploration of biological functions and potential biomarker applications of KSHV. 

While KSHVbook currently provides an abundance of valuable information, the existing content still lacks depth and requires updating and improvement. Our goal is to develop it into a comprehensive encyclopedia of KSHV-related information, enabling users to access a wide range of data on a single website. With ambitious aspirations, we welcome valuable feedback and suggestions from the broader community to help us gradually enhance this platform. We will acknowledge the contributions of users who provide recommendations in appropriate places to highlight their valuable input. We aim to leverage the open-sharing nature of the internet to continually expand the influence of KSHVbook and significantly contribute to the advancement of KSHV research. Stay tuned for ongoing updates and new features available on our website.

