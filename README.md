# ServerlssJKMeter
Docker image to run apache-jmeter-4.0 

Run using the below command 
    docker run -v "$(pwd)/results:/tmp/" -v "$(pwd)/jmx:/opt/jmeter/jmx/ServerlssJKMeter/Dockerfiles/" -it jkm1 jkm1  

Pre-requisites: 

Save your .jmx file as "myproject.jmx" and keep it in {PWD}/jmx/ 
Results will be saved as "myprj.jtl" under {PWD}/results 