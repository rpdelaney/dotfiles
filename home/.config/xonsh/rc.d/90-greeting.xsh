from pathlib import Path

_neofetch_file = Path("/tmp", "neofetch_cache.tmp")

if _neofetch_file.is_file():
    cat f"{str(_neofetch_file)}"
else:
    neofetch | tee f"{str(_neofetch_file)}"
