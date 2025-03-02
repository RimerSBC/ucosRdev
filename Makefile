.PHONY: clean All

All:
	@echo "==========Building project:[ ucosRdev - Release_uf2 ]----------"
	@"$(MAKE)" -f  "ucosRdev.mk" && "$(MAKE)" -f  "ucosRdev.mk" PostBuild
clean:
	@echo "==========Cleaning project:[ ucosRdev - Release_uf2 ]----------"
	@"$(MAKE)" -f  "ucosRdev.mk" clean
