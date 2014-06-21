#
# jasongiedymin/ansible-ruby
#   docker build -t jasongiedymin/ansible-ruby .
#
# Requires:
# jasongiedymin/ansible-ruby
#   https://github.com/AnsibleShipyard/ansible-base-ubuntu
#

FROM jasongiedymin/ansible-ruby
MAINTAINER AnsibleShipyard

# Working dir
WORKDIR /tmp/build/ansible-ruby

# ADD
ADD meta $WORKDIR/meta
ADD tasks $WORKDIR/tasks
ADD tests $WORKDIR/tests
ADD vars $WORKDIR/vars

# Here we continue to use add because
# there are a limited number of RUNs
# allowed.
ADD tests/inventory /etc/ansible/hosts
ADD tests/playbook.yml $WORKDIR/playbook.yml

# Execute
RUN ansible-playbook $WORKDIR/playbook.yml -c local -vvvv
