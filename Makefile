# default:
# 	git pull
# 	ansible-playbook -e component=$(component) robo.yaml

# all:
# 	git pull
# 	make component=mongodb
# 	make component=redis
# 	make component=mysql
# 	make component=rabbitmq
# 	make component=catalogue
# 	make component=user
# 	make component=cart
# 	make component=shipping
# 	make component=payment
# 	make component=frontend

# 1. Define your components as a list
COMPONENTS = mongodb redis mysql rabbitmq catalogue user cart shipping payment frontend

# 2. Tell Make these are not actual files
.PHONY: all pull $(COMPONENTS)

# 3. Default: Runs everything
all: pull $(COMPONENTS)

# 4. Pull logic
pull:
	git pull

# 5. SIMPLER LIST: This one rule handles every component in the list
$(COMPONENTS): pull
	ansible-playbook -e component=$@ robo.yaml
