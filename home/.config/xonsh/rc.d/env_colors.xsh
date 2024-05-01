_STYLES = {
    "default": $(tput sgr0) or $(tput me),
    "color": {
        "fg": {
            "black": $(tput setaf 0) or $(tput AF 0),
            "blue": $(tput setaf 38) or $(tput AF 38),
            "blue": $(tput setaf 38) or $(tput AF 38),
            "cyan": $(tput setaf 123) or $(tput AF 123),
            "green": $(tput setaf 71) or $(tput AF 71),
            "magenta": $(tput setaf 127) or $(tput AF 127),
            "red": $(tput setaf 124) or $(tput AF 124),
            "white": $(tput setaf 15) or $(tput AF 15),
            "yellow": $(tput setaf 228) or $(tput AF 228),
        },
        "bg": {
            "black": $(tput setab 0) or $(tput AB 0),
            "blue": $(tput setab 38) or $(tput AB 38),
            "cyan": $(tput setab 123) or $(tput AB 123),
            "green": $(tput setab 71) or $(tput AB 71),
            "magenta": $(tput setab 127) or $(tput AB 127),
            "red": $(tput setab 124) or $(tput AB 124),
            "white": $(tput setab 15) or $(tput AB 15),
            "yellow": $(tput setab 228) or $(tput AB 228),
        }
    },
    "mode": {
        "alt": $(tput smcup) or $(tput ti),
        "ealt": $(tput rmcup) or $(tput te),
        "bold": $(tput bold) or $(tput md),
#       "blink": $(tput blink) or $(tput mb),
        "dim": $(tput dim) or $(tput mh),
        "eitalic": $(tput ritm) or $(tput ZR),
        "estout": $(tput rmso) or $(tput se),
        "eunder": $(tput rmul) or $(tput ue),
        "italic": $(tput sitm) or $(tput ZR),
        "stout": $(tput smso) or $(tput so),
        "under": $(tput smul) or $(tput us),
        "reverse": $(tput rev) or $(tput mr),
    },
}

#$LESS_TERMCAP_mb = _STYLES["mode"].get("blink", "")
$LESS_TERMCAP_md = _STYLES["color"]["fg"].get("blue", "")
$LESS_TERMCAP_me = _STYLES["mode"].get("default", "")
$LESS_TERMCAP_mh = _STYLES["mode"].get("dim", "")
$LESS_TERMCAP_se = _STYLES["mode"].get("estout", "")
$LESS_TERMCAP_so = _STYLES["mode"].get("stout", "")
$LESS_TERMCAP_ue = _STYLES["mode"].get("eitalic", "")
$LESS_TERMCAP_us = _STYLES["mode"].get("italic", "")
