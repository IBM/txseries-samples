# TXSeries container with COBOLIT

This particular project demonstrate of running TXSeries container with COBOLIT Installation Verification Program (IVP) sample;

**Pre-requirements**: ibmcom/txseries docker image (https://hub.docker.com/r/ibmcom/txseries/) and licensed COBOLIT image. 

**Note**: Installation Verification Program (IVP) sample is a terminal based banking application with Deposit and Browse facilities. The application uses VSAM file to store the user data. For more details on IVP follow the [link](https://www.ibm.com/support/knowledgecenter/en/SSAL2T_9.1.0/com.ibm.cics.tx.doc/tasks/t_usg_tx_ivp_w_cobol.html)

To build TXSeries and COBOLIT docker image, follow the bellow steps

1. Copy the COBOLIT product image and license file to project directory
2. Modify the Dockerfile for the COBOLIT product image file name and license file name 
3. Build the docker image 
```
   docker build -t txseries-cobolit .
```
4. Run the docker image
```
   docker run -it -p 3270:3270 -p 9443:9443 -v <full-path-to>/<COBOLIT-license-file>:/opt/cobol-it/license/<COBOLIT-license-file> -e LICENSE=accept txseries-cobolit
```   
5. Use the 3270 telnet client to connect to TXSeries region <Host IP Address>:3270
6. User can run the IVP sample to vallidate whether the COBOLIT compiled applications are working successfully on TXSeries region
7. User can connect to TXSeries Administration Console using https://Host-IP-Address:9443/txseries/admin  with username txadmin and password txadmin
8. Follow the [IVP-Sample] (https://www.ibm.com/support/knowledgecenter/en/SSAL2T_9.1.0/com.ibm.cics.tx.doc/tasks/t_usg_tx_ivp_w_cobol.html) for more details
