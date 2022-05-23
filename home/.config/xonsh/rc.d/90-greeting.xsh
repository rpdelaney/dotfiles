from pathlib import Path

neofetch_file = Path("/tmp", "neofetch_cache.tmp")

if neofetch_file.is_file():
    cat f"{str(neofetch_file)}"
else:
    neofetch | tee f"{str(neofetch_file)}"
