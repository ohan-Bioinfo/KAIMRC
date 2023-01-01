workflow Xtea {
    call Transposable_Element
}   


task Transposable_Element {
    File bam_path
    File BAM_aligment
    File Index
    File genome_ref
    File repeats_tar
    File Annotation
    File sample
    
    
        command {
        
        	echo "_________________------------PWD----------------------------------------------____________"
        	pwd
            
            echo "_________________------------PWD----------------------------------------------____________"
            ls
            
            echo "_________________----------Starting update Ubuntu-----------------------------____________"
        	apt-get update
            
			echo "_________________------------Starting wget installation-----------------------____________"
        	apt-get install wget -y
            
            echo "_________________-----------conda installation-----------------------____________"
            wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh -O $HOME//miniconda.sh
			bash ~/miniconda.sh -b -p $HOME/miniconda # silent mode
			echo "export PATH=\$PATH:\$HOME/miniconda/bin" >> $HOME/.bashrc # add to .bashrc
			source $HOME/.bashrc
            source  $HOME/miniconda/bin/activate
			conda init
            
            echo "_________________------------------ls---------------------------------------------------____________"
            ls
            ls $HOME
            
            echo "_________________------------cat .Bashrc after init-------------------------------------____________"
            cat $HOME/.bashrc
            
            echo "_________________------------reSource  .Bashrc after init-------------------------------____________"
            source $HOME/.bashrc
            
            echo "_________________------------conda update-----------------------------------------------____________"
            conda update -y conda
            
            
            echo "_________________------------conda Config channels--------------------------------------____________"

            conda config --add channels defaults
 			conda config --add channels bioconda
 			conda config --add channels conda-forge
 	           
            echo "_________________------------conda create ENV + install xtea 1.6--------------------------------------____________"
 			conda create -n xtea_env xtea=0.1.6 -y -c bioconda
            
            echo "_________________----------conda activate ENV---------------------------------------------------------____________"
            conda activate xtea_env


            echo "_________________------------test xtea help-----------------------------------------------------------____________"
            xtea -h
            
            echo "_________________-------------------------------------------------------------------------------------____________"
            echo "_________________--------------ls----ls $HOME---------------------------------------------------------____________"
            ls $HOME
            
               echo "_________________---------------ls /root/--------------------------------------------------------------____________"
            ls /root/
            
               echo "_________________-------------ls--/root/miniconda/---------------------------------------------------____________"
            ls /root/miniconda/
            
             echo "_________________---------------/root/miniconda/envs/------------------------------------------------____________"
            ls /root/miniconda/envs/
            
               echo "_________________---------------/root/miniconda/envs/xtea_env/-------------------------------------____________"
            ls /root/miniconda/envs/xtea_env/
            
               echo "_________________---------------/root/miniconda/envs/xtea_env/lib----------------------------------____________"
            ls /root/miniconda/envs/xtea_env/lib
            
       		   echo "_________________---------------chmod +x /root/miniconda/envs/xtea_env/lib/*py---------------------____________"
			chmod +x /root/miniconda/envs/xtea_env/lib/*py
         




           
		   echo "----------------------dir /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation-----------"
           mkdir /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation
           tar -zxvf /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation.tar.gz -C /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation
           
           
           echo "----------------------realpath /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/NDX-22-829-004.bam-------------"
           realpath /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/NDX-22-829-004.bam
           
           echo "----------------------cp NDX-22-829-004.bam.bai to origin bam path-------------"
           cp /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/submissions/8707004c-d5b3-464d-88a1-95b34f9203c2/samtools_workflow/24c0b5d8-039c-4348-8fed-e708bc2d3c03/call-samtools_index/NDX-22-829-004.bam.bai /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/ 
           
           
           echo "------------------------------------------------creating path txt file-----------------------------------____________"
           echo "NDX-22-829-004 /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/NDX-22-829-004.bam" >> LocalBamPath.txt
           
           
           echo "_________________-------------------- path localfile txt file---------------------------------------------------____________"
           pwd LocalBamPath.txt
           
           echo "_________________--------------------cat all *txt path inside localisation txt file-----------------------____________"
           cat /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/*.txt
           
           echo "_________________------------mkdir workdicr--------------------------------------------------------------____________"
           mkdir workingdir
           
           echo "_________________gunzip /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/GCF_000001405.40_GRCh38.p14_genomic.fna.gz____________"
           ls
           gunzip /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/GCF_000001405.40_GRCh38.p14_genomic.fna.gz

			echo "____________________checking directory before starting---------------------"
            ls 
            ls /cromwell_root/
            ls /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c
			echo "____________________Python script starting ---------------------"
            
        	 xtea -i ./cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/Id.txt \
             -b ./cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/bam2.txt.txt \
            -x null \
            --xtea /root/miniconda/envs/xtea_env/lib/ \
            -p ./cromwell_root/workingdir/ -o submit.sh \
            -l ./cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation/ \
            -r ./cromwell_root/gcp-public-data--broad-references/hg38/v0/Homo_sapiens_assembly38.fasta \
            -g ./cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/GCF_000001405.40_GRCh38.p14_genomic.gff \
            -f 5907 -y 7 -n 8
            
           echo "_________________------------------ls-----------------____________"
           ls
           
           echo "_________________------------------ls--/cromwell_root/workingdir/---------------____________"
           ls /cromwell_root/workingdir/
           
           
            echo "-----------------Cat Original scripts--submit.sh------------------------------------------"
            cat submit.sh
            
            
            echo "__________________________PATH-------pwd-----------------------------------------------------"
            pwd


            echo "_________________SED+____CAT- submit Script After SED command sed 's/sbatch/sh/g' submit.sh > submit1.sh___"
			sed 's/sbatch/sh/g' submit.sh > submit1.sh
            
            echo "_____________________CAT- submit ---cat submit1.sh-------------------------___"
            cat submit1.sh

 

            echo "_________________________Cat--L1 Bash____cat /cromwell_root/workingdir/NDX-22-829-004/L1/run_xTEA_pipeline.sh________________________"
            cat /cromwell_root/workingdir/NDX-22-829-004/L1/run_xTEA_pipeline.sh

            echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            
            echo "____________-----------Permission-------------"
            
            chmod +x submit.sh
            echo "_________________------------------------------------------____________"
                        echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
                        echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
                        echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
                        echo "_________________-----------------------------------____________"
            echo "_________________-----------------------------------____________"
            echo "_________________------------excute-----------------------____________"
            sh submit1.sh
            
        }
        
        runtime {
    	    cpu: 4
  	    	memory: "24GB"
            disks: "local-disk 501 HDD"
            docker: "ubuntu:latest"
        }        
        output {
        	File results= "${sample}.Transposable_Element.results"
        }

}
