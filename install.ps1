# ==============================================================================
#
# Copyright 2018 ConEmu.Maximus5@gmail.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================

$dst = "C:\ConEmu"
$ver = "alpha"
$xml = ""
$lnk = $TRUE
$run = $FALSE

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

iex ((new-object net.webclient).DownloadString('https://conemu.github.io/install2.ps1'))
