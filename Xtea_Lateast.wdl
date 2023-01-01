workflow Xtea {
    call Transposable_Element
}   


task Transposable_Element {
    File input_bam
    File BAMpath
    File Index
    File genome_ref
    File repeats_tar
    File Annotation_gff
    File sample
    
    
        command {
            echo "__________________________PATH----------------------____________"
            pwd

            echo "__ln -s /usr/local/bin/ /cromwell_root/ ls---------------_______"
            ln -s /usr/local/bin/ /cromwell_root/ 
            ls

            echo "_________________ls-gcp-public-data--broad-references-____________"
            ls gcp-public-data--broad-references
           
           echo "__ls   what inside fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c-----------"

           ls fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/
           tar -zxvf /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/GRCh38.p13.genome.fa.gz.tar
            
           echo "_________________-------- mkdir /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation---------------------------____________"
           
           mkdir /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation
           ls /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/
           
           echo "_________________tar -zxvf /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation.tar.gz ---------------------------____________"
           tar -zxvf /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation.tar.gz -C /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation
           
           echo "_________________------------ls rep_lib_annoat-----------------------____________"
           ls /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation

           echo "_________________-----------------------------------____________"
          
            
            
 
           
           
           echo "_________________--- mkdir WorkingDir--------------____________"
           
           mkdir WorkingDir
           
           echo "_________________-----------------------------------____________"
           echo "_________________-----------------------------------____________"
           echo "_________________-----------------------------------____________"
           echo "_________________-----------------------------------____________"
           
           ls
           echo "_________________gunzip GRCh38.p13.genome.fa.gz____________"
           gunzip GRCh38.p13.genome.fa.gz
           echo "_________________-----------------------------------____________"
           ls
    
           
           echo "____________________Python script starting ---------------------"
            
        	python /cromwell_root/bin/gnrt_pipeline_local_v38.py -i ${sample} \
            -b ${BAMpath} \
            -x null \
            --xtea /cromwell_root/bin/ -p /cromwell_root/WorkingDir/ -o submit.sh \
            -l /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation/ \
            -r /cromwell_root/GRCh38.p13.genome.fa \
            -g ${Annotation_gff} \
            -f 5907 -y 5

           
           echo "_________________-----------------------------------____________"
           echo "_________________-----------------------------------____________"
           echo "_________________-----------------------------------____________"
           echo "_________________-----------------------------------____________"
           echo "_________________-----------------------------------____________"
           
            echo "-----------------Cat Original scripts--submit.sh-----------"
            cat submit.sh
            
            echo "__________________________PATH-------------"
            pwd
            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"

            
            echo "________List Localisation\ General AFTER PYTHONS===========____"
            ls
            echo "_______ls fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71===========____"

            ls fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c
            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            echo "_________-_____________List bin\--------------------____________"

            ls bin/
            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            echo "_________________SED+____CAT- submit Script After SED command___"

            sed 's/sbatch/sh/g' submit.sh > submit1.sh
            cat submit1.sh

            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"     
            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"


            echo "_________________________Cat--Script (L1) Bash____________________________"

            cat /cromwell_root/WorkingDir/NDX-22-829-004/L1/run_xTEA_pipeline.sh
            
            echo "_____________________________________________________"


            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            echo "_____________run_______Submitting-----------Permission-------------"
            
            chmod +x submit.sh
            sh submit1.sh
            
        }
        
        runtime {
    	    cpu: 4
  	    	memory: "24GB"
            disks: "local-disk 501 HDD"
            docker: "cgap/xtea_germline:v0.1.9"
        }        
        output {
        	File results= "${sample}.Transposable_Element.results"
        }

}