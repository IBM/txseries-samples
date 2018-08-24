REGION=$1
SFS_NAME=$2

export PATH=${COBOLITDIR}/bin:${PATH}
export LD_LIBRARY_PATH="${COBOLITDIR}/lib:${LD_LIBRARY_PATH}"

# Compile COBOLIT samples
cd /work/autoinstall-dropin/ 
cp -R /opt/ibm/cics/samples/ivp/* .
/usr/bin/make Makefile COBOLIT
cp *map /var/cics_regions/$REGION/maps/en_US/


# Configure region and SFS Server for COBOLIT
cicscp -v start sfs_server $SFS_NAME
cicsivp -r $REGION -s /.:/cics/sfs/$SFS_NAME -v sfs_$SFS_NAME -l COBOLIT  
cicsupdate -c pd -r $REGION DFHCGA PathName="DFHCGA.map"
cicsupdate -c pd -r $REGION DFHCGC PathName="DFHCGC.map"
cicsupdate -c pd -r $REGION DFHCGL PathName="DFHCGL.map"
cicsupdate -c pd -r $REGION DFHCBRW PathName="dfhcbrw"
cicsupdate -c pd -r $REGION DFHCMNU PathName="dfhcmnu"
cicsupdate -c pd -r $REGION DFHCGB PathName="DFHCGB.map"
cicsupdate -c pd -r $REGION DFHCGK PathName="DFHCGK.map"
cicsupdate -c pd -r $REGION DFHCALL PathName="dfhcall"
cicsupdate -c pd -r $REGION DFHCCOM PathName="dfhccom"
cicsupdate -c pd -r $REGION DFHCREN PathName="dfhcren"
echo "COB_LIBRARY_PATH=/work/autoinstall-dropin/" > /var/cics_regions/$REGION/environment
