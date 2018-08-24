FROM ibmcom/txseries

# Copy and install cobol-it
# ADD will untar and copy the content into /opt
ADD < COBOLIT tar.gz image > /opt
RUN mkdir /opt/cobol-it/license/

# Add environment variables for the compiler suite
ENV DEFAULT_CITDIR=/opt/cobol-it
ENV COBOLITDIR ${DEFAULT_CITDIR}
ENV PATH=${COBOLITDIR}/bin:${PATH}
ENV LD_LIBRARY_PATH="${COBOLITDIR}/lib:${LD_LIBRARY_PATH}"
ENV DYLD_LIBRARY_PATH="${COBOLITDIR}/lib:${DYLD_LIBRARY_PATH}"
ENV SHLIB_PATH="${COBOLITDIR}/lib:${SHLIB_PATH}"
ENV LIBPATH="${COBOLITDIR}/lib:${LIBPATH}"
ENV COBOLIT_LICENSE=/opt/cobol-it/license/citlicense.xml
ENV COB="COBOL-IT"
ENV LANG="en_US"
RUN locale-gen en_US 
ENV LC_ALL="en_US"

RUN cicsmkcobolit -lcobit -o /opt/ibm/cics/bin

COPY ./region-ivp-setup.sh /work/setup.sh
