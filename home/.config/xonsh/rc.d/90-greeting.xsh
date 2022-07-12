from pathlib import Path

def _print_greeting():
    _neofetch_file = Path("/tmp", "neofetch_cache.tmp")

    if _neofetch_file.is_file():
        cat f"{str(_neofetch_file)}"
    else:
        neofetch | tee f"{str(_neofetch_file)}"

    del _neofetch_file

# _print_greeting
del _print_greeting
