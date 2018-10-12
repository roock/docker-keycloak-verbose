FROM jboss/keycloak:4.5.0.Final

ADD event-listener-sysout-example.jar /opt/jboss/keycloak/standalone/deployments/

ADD event-listener-sysout.cli /opt/jboss/tools/cli/

RUN /opt/jboss/keycloak/bin/jboss-cli.sh --file=/opt/jboss/tools/cli/event-listener-sysout.cli

RUN rm -rf /opt/jboss/keycloak/standalone/configuration/standalone_xml_history

## cleanup logfiles
#
#CMD rm /opt/jboss/keycloak/standalone/log/server.log.*
#CMD truncate /opt/jboss/keycloak/standalone/log/server.log

# copy from upstream image

USER 1000

EXPOSE 8080

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]

