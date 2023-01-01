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
            echo "_________________------------cat .Bashrc after init-------------------------------------____________"
            ls $HOME
          
            cat $HOME/.bashrc
            
            echo "_________________------------reSource  .Bashrc after init-------------------------------____________"
            source $HOME/.bashrc
            
            echo "_________________------------conda update-----------------------------------------------____________"
            conda update -y conda
            
            
            echo "_________________------------conda Config channels--------------------------------------____________"

            conda config --add channels defaults
 			conda config --add channels bioconda
 			conda config --add channels conda-forge
 	           
            echo "_________________------------conda create ENV + install xtea 1.6------------------------____________"
 			conda create -n xtea_env xtea=0.1.6 -y -c bioconda
            
            echo "_________________----------conda activate ENV-------------------------------------------____________"
            conda activate xtea_env

            echo "_________________-----------------------------------------------------------------------____________"
            echo "what inside Localisation-----and path------"

            ls fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/
            pwd
            
            echo "_________________-----------------------------------------------------------------------____________"
            echo "_________________------------test xtea help--------------------------------------------____________"
            xtea -h
            echo "_________________-----------------------------------------------------------------------____________"
            echo "_________________--------------ls----ls $HOME/miniconda3/---------------------------------------------------------____________"
            ls $HOME
               echo "_________________---------------$HOME/miniconda3/envs/------------------------------____________"
            ls /root/
               echo "_________________---------------$HOME/miniconda3/envs/------------------------------____________"
            ls /root/miniconda/
             echo "_________________---------------$HOME/miniconda3/envs/------------------------------____________"
            ls /root/miniconda/envs/
               echo "_________________---------------$HOME/miniconda3/envs/------------------------------____________"
            ls /root/miniconda/envs/xtea_env/
               echo "_________________---------------$HOME/miniconda3/envs/------------------------------____________"
            ls /root/miniconda/envs/xtea_env/lib
           

         



            echo "_________________-----------------------------------------------------------------------____________"
            echo "_________________---Copy index To the sortedBam-----------------------------------------____________"
        
           cp /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/submissions/8707004c-d5b3-464d-88a1-95b34f9203c2/samtools_workflow/24c0b5d8-039c-4348-8fed-e708bc2d3c03/call-samtools_index/NDX-22-829-004.bam.bai /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/submissions/60e69aa0-0d31-4cf1-ba73-9fc71f7167d2/sortSamWorkflow/13ffa994-fa3f-4471-907a-030103448be1/call-sortSam/NDX-22-829-004.sorted.bam.bai
            
           echo "_________________---Done---cp------------------------------------------------------------____________"
           echo "_________________---Confirm cp------ls sort-bam------------------------------------------____________"
           
           ls /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/submissions/60e69aa0-0d31-4cf1-ba73-9fc71f7167d2/sortSamWorkflow/13ffa994-fa3f-4471-907a-030103448be1/call-sortSam/
           
           echo "_________________------------------------------------------------------------------------____________"
           echo "_________________------------------------------------------------------------------------____________"
           
           
           
           mkdir /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation
           tar -zxvf /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation.tar.gz -C /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation
           
           echo "_________________--------------------Checking Path------------------------------____________"
           realpath /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/submissions/60e69aa0-0d31-4cf1-ba73-9fc71f7167d2/sortSamWorkflow/13ffa994-fa3f-4471-907a-030103448be1/call-sortSam/NDX-22-829-004.sorted.bam
           
           echo "_________________--------------------creating path txt file-----------------------------____________"
           echo "NDX-22-829-004 /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/submissions/60e69aa0-0d31-4cf1-ba73-9fc71f7167d2/sortSamWorkflow/13ffa994-fa3f-4471-907a-030103448be1/call-sortSam/NDX-22-829-004.sorted.bam" >> LocalBamPath.txt
           echo "_________________--------------------cat path txt file-----------------------------____________"
           cat LocalBamPath.txt  
           echo "_________________--------------------cat all txt path inside localisation txt file-----------------------------____________"
           cat /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/*.txt
           
           echo "_________________------------mkdir workdicr-----------------------____________"
           mkdir workingdir
           
           echo "____________________Python script starting ---------------------"
        	 xtea -i ${sample} \
            -x null \
            --xtea /root/miniconda/envs/xtea_env/lib/ \
            -b LocalBamPath.txt \
            -p ./workingdir/ \
            -o submit.sh \
            -l /cromwell_root/fc-00bcc31d-9daf-40fa-bca6-2c6aa332a71c/rep_lib_annotation/ \
            -r ${genome_ref} \
            -g ${Annotation} \
            -y 1 -f 2907 -n 8  

           
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


            echo "_________________________Cat--L1 Bash____________________________"

            cat /cromwell_root/workingdir/NDX-22-829-004/L1/run_xTEA_pipeline.sh

         


    
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
            docker: "ubuntu:latest"
        }        
        output {
        	File results= "${sample}.Transposable_Element.results"
        }

}