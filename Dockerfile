FROM jboss/keycloak:4.5.0.Final

ADD event-listener-sysout-example.jar /opt/jboss/keycloak/standalone/deployments/

CMD /opt/jboss/keycloak/bin/jboss-cli.sh --command="module add --name=org.keycloak.examples.event-sysout --resources=target/event-listener-sysout"

ADD event-listener-sysout.cli /opt/jboss/tools/cli/

CMD /opt/jboss keycloak/bin/jboss-cli.sh --file=/opt/jboss/tools/cli/event-listener-sysout.cli

# copy from upstream image
USER 1000

EXPOSE 8080

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]

