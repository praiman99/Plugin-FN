#!/bin/bash
#
# This file encrypted at Sat 27 Apr 2024 10:59:12 AM UTC by
# +------------------------------------------------------+
# | Author: Rerechan02                                   |
# | Reguon: Indonesia ( Asia Tenggara )                  |
# | Chanel: https://t.me/fn_project / Admin  @Rerechan02 |
# +------------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com/Rerechan02
# Sponsor this project:
# -  https://t.me/fn_project/245
# -  https://prof.rerechan02.com

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | 9M:gS:k3:AG:xM:P1:5X:OP:eo:1Q:Es:3y:ik:aR:b6:dW:L6:6N:QU:iB:wW:rz:oW:8n:pG:IP:GY:lZ:Vk:T4:ze:St:9k:Po:5U:dg:69:g8:xF:Cg:xH:FZ:6N:ym:r5:Vf:VZ:lj:k4:Nr:Ij:jf:fp:4j:aG:6U:Ra:1W:2p:7b:wL:LN:af:FX:ae:Si:TQ:BY:KD:Gm:KP:1E:nE:eH:Wf:Ne:8l:pu:mh:xJ:5t:BT:0P:eV:Td:jL:IS:Vz:k7:qg:Il:oe:3e:IS:hi:1e:h2:x7:As:VU:ti:rI:Ei:tn:mp:QO:wo:eU:3q:sX:zW:2b:BK:Jv:6L:0H:tq:9z:88:iH:gg:oP:Ik:hR:CP:kT:am:Py:C7:pj:Yt:wX:C6:8H:3O:Gw:uu:R5:HQ:ED:sN:tX:ME:82:mC:RL:oZ:uZ:VD:pK:fW:ps:Wn:dd:R9:2q:nA:ET:vD:oZ:gr:XD:Am:2i:Io:X0:u6:l0:SZ:DS:Hg:av:CR:KU:Rs:8c:37:Xp:z9:Uv:mN:nE:Zf:U1:iO:jo:2O:lt:yl:zR:YF:wo:rA:gj:8U:Sl:ad:Qi:fF:B9:6c:YG:Ig:cI:E6:sy:Bn:qV:2M:WL:6h:TJ:6f:hf:69:4t:qx:9I:0I:Ty:RL:JO:WC:eB:L4:9l:hS:lp:dJ:xU:qu:S6:ZV:GF:2w:Yc:eP:kv:Ap:jj:tw:pE:3X:p6:9H:N0:3y:jU:9y:wc:7Q:xK:1h:1A:I5:oN:mK:Px:K9:dp:2h:Rd:mO:ht:YH:Y7:bF:ea:fM:9u:hc:Pe:T2:2N:E6:jP:aH:pv:B9:Ws:Z3:dH:z2:WP:6Y:je:5u:SF:Wo:mO:CW:lk:af:dU:sm:vH:Ea:pZ:WP:US:CN:Nq:Il:vZ:4o:Fn:Gx:Cz:2S:oJ:Hj:FF:UT:nQ:RS:xe:Kj:rR:zf:Tq:TZ:3r:kv:Vb:F0:oZ:bu:vR:og:XB:zj:JN:Gy:UZ:Zw:ts:eQ:gr:rE:pH:Ht:ok:sU:RH:Le:qg:N4:nu:fm:HS:x7:tA:0h:2c:dZ:aM:LR:RH:NZ:O8:0l:aZ:gM:hv:LC:kt:xz:Nb:qQ:iD:jE:Cj:9s:QI:Cp:3B:ji:Gv:ek:Dg:Zv:Q8:RS:eN:WL:3t:1G:55:Up:UM:4X:Ag:2G:2h:fN:ml:1m:kW:kc:Sw:bp:aN:Ot:eS:sF:po:qm:3N:WC:7p:rS:OH:YG:ur:ta:pZ:tt:gN:8B:vl:IN:F0:se:I6:B7:T2:5x:uC:7d:wv:vs:vp:Hm:nZ:gI:7l:el:XF:Mv:zh:5S:8D:Gm:Vj:Fx:SF:Aq:Wg:42:fe:Aj:4H:e2:Sf:O8:qS:HW:pW:Wk:xX:H3:Oz:uT:V9:Ap:hl:EF:bm:BH:SY:xM:6O:eX:Nq:zk:jh:4T:YI:8i:2h:2j:RT:qg:pJ:cO:a4:rv:k0:xg:yQ:zt:Jq:Vq:0g:Vj:4k:Ob:QP | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Rerechan02 | 9M:gS:k3:AG:xM:P1:5X:OP:eo:1Q:Es:3y:ik:aR:b6:dW:L6:6N:QU:iB:wW:rz:oW:8n:pG:IP:GY:lZ:Vk:T4:ze:St:9k:Po:5U:dg:69:g8:xF:Cg:xH:FZ:6N:ym:r5:Vf:VZ:lj:k4:Nr:Ij:jf:fp:4j:aG:6U:Ra:1W:2p:7b:wL:LN:af:FX:ae:Si:TQ:BY:KD:Gm:KP:1E:nE:eH:Wf:Ne:8l:pu:mh:xJ:5t:BT:0P:eV:Td:jL:IS:Vz:k7:qg:Il:oe:3e:IS:hi:1e:h2:x7:As:VU:ti:rI:Ei:tn:mp:QO:wo:eU:3q:sX:zW:2b:BK:Jv:6L:0H:tq:9z:88:iH:gg:oP:Ik:hR:CP:kT:am:Py:C7:pj:Yt:wX:C6:8H:3O:Gw:uu:R5:HQ:ED:sN:tX:ME:82:mC:RL:oZ:uZ:VD:pK:fW:ps:Wn:dd:R9:2q:nA:ET:vD:oZ:gr:XD:Am:2i:Io:X0:u6:l0:SZ:DS:Hg:av:CR:KU:Rs:8c:37:Xp:z9:Uv:mN:nE:Zf:U1:iO:jo:2O:lt:yl:zR:YF:wo:rA:gj:8U:Sl:ad:Qi:fF:B9:6c:YG:Ig:cI:E6:sy:Bn:qV:2M:WL:6h:TJ:6f:hf:69:4t:qx:9I:0I:Ty:RL:JO:WC:eB:L4:9l:hS:lp:dJ:xU:qu:S6:ZV:GF:2w:Yc:eP:kv:Ap:jj:tw:pE:3X:p6:9H:N0:3y:jU:9y:wc:7Q:xK:1h:1A:I5:oN:mK:Px:K9:dp:2h:Rd:mO:ht:YH:Y7:bF:ea:fM:9u:hc:Pe:T2:2N:E6:jP:aH:pv:B9:Ws:Z3:dH:z2:WP:6Y:je:5u:SF:Wo:mO:CW:lk:af:dU:sm:vH:Ea:pZ:WP:US:CN:Nq:Il:vZ:4o:Fn:Gx:Cz:2S:oJ:Hj:FF:UT:nQ:RS:xe:Kj:rR:zf:Tq:TZ:3r:kv:Vb:F0:oZ:bu:vR:og:XB:zj:JN:Gy:UZ:Zw:ts:eQ:gr:rE:pH:Ht:ok:sU:RH:Le:qg:N4:nu:fm:HS:x7:tA:0h:2c:dZ:aM:LR:RH:NZ:O8:0l:aZ:gM:hv:LC:kt:xz:Nb:qQ:iD:jE:Cj:9s:QI:Cp:3B:ji:Gv:ek:Dg:Zv:Q8:RS:eN:WL:3t:1G:55:Up:UM:4X:Ag:2G:2h:fN:ml:1m:kW:kc:Sw:bp:aN:Ot:eS:sF:po:qm:3N:WC:7p:rS:OH:YG:ur:ta:pZ:tt:gN:8B:vl:IN:F0:se:I6:B7:T2:5x:uC:7d:wv:vs:vp:Hm:nZ:gI:7l:el:XF:Mv:zh:5S:8D:Gm:Vj:Fx:SF:Aq:Wg:42:fe:Aj:4H:e2:Sf:O8:qS:HW:pW:Wk:xX:H3:Oz:uT:V9:Ap:hl:EF:bm:BH:SY:xM:6O:eX:Nq:zk:jh:4T:YI:8i:2h:2j:RT:qg:pJ:cO:a4:rv:k0:xg:yQ:zt:Jq:Vq:0g:Vj:4k:Ob:QP | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�