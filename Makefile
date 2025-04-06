.PHONY: clean All

All:
	@echo "==========Building project:[ ucosRdev - Debug ]----------"
	@"$(MAKE)" -f  "ucosRdev.mk" && "$(MAKE)" -f  "ucosRdev.mk" PostBuild
clean:
	@echo "==========Cleaning project:[ ucosRdev - Debug ]----------"
	@"$(MAKE)" -f  "ucosRdev.mk" clean
