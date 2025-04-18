# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOTNET_PKG_COMPAT=8.0
NUGETS="
avalonia.angle.windows.natives@2.1.22045.20230930
avalonia.buildservices@0.0.29
avalonia.controls.colorpicker@11.1.3
avalonia.controls.datagrid@11.1.3
avalonia.desktop@11.1.3
avalonia.diagnostics@11.1.3
avalonia.freedesktop@11.1.3
avalonia.native@11.1.3
avalonia.remote.protocol@11.1.3
avalonia.skia@11.1.3
avalonia.themes.fluent@11.1.3
avalonia.themes.simple@11.1.3
avalonia.win32@11.1.3
avalonia.x11@11.1.3
avalonia@11.1.3
castle.core@5.1.1
coverlet.collector@6.0.2
dotnet-xunit@2.3.1
harfbuzzsharp.nativeassets.linux@7.3.0.2
harfbuzzsharp.nativeassets.macos@7.3.0.2
harfbuzzsharp.nativeassets.webassembly@7.3.0.2
harfbuzzsharp.nativeassets.win32@7.3.0.2
harfbuzzsharp@7.3.0.2
libuv@1.9.0
microcom.runtime@0.11.0
microsoft.codeanalysis.analyzers@1.1.0
microsoft.codeanalysis.common@1.3.0
microsoft.codeanalysis.csharp@1.3.0
microsoft.codeanalysis.visualbasic@1.3.0
microsoft.codecoverage@17.11.1
microsoft.csharp@4.0.1
microsoft.identity.client.extensions.msal@4.65.0
microsoft.identity.client@4.65.0
microsoft.identitymodel.abstractions@6.35.0
microsoft.net.test.sdk@17.11.1
microsoft.netcore.app@1.0.0
microsoft.netcore.dotnethost@1.0.1
microsoft.netcore.dotnethostpolicy@1.0.1
microsoft.netcore.dotnethostresolver@1.0.1
microsoft.netcore.jit@1.0.2
microsoft.netcore.platforms@1.0.1
microsoft.netcore.runtime.coreclr@1.0.2
microsoft.netcore.targets@1.0.1
microsoft.netcore.windows.apisets@1.0.1
microsoft.testplatform.objectmodel@17.11.1
microsoft.testplatform.testhost@17.11.1
microsoft.visualbasic@10.0.1
microsoft.win32.primitives@4.0.1
microsoft.win32.registry@4.0.0
moq@4.20.72
netstandard.library@1.6.0
newtonsoft.json@13.0.1
reportgenerator@5.3.10
runtime.native.system.io.compression@4.1.0
runtime.native.system.net.http@4.0.1
runtime.native.system.net.security@4.0.1
runtime.native.system.security.cryptography@4.0.0
runtime.native.system@4.0.0
skiasharp.nativeassets.linux@2.88.8
skiasharp.nativeassets.macos@2.88.8
skiasharp.nativeassets.webassembly@2.88.8
skiasharp.nativeassets.win32@2.88.8
skiasharp@2.88.8
system.appcontext@4.1.0
system.buffers@4.0.0
system.collections.concurrent@4.0.12
system.collections.immutable@1.2.0
system.collections@4.0.11
system.commandline@2.0.0-beta4.22272.1
system.componentmodel.annotations@4.1.0
system.componentmodel@4.0.1
system.console@4.0.0
system.diagnostics.debug@4.0.11
system.diagnostics.diagnosticsource@4.0.0
system.diagnostics.diagnosticsource@6.0.1
system.diagnostics.eventlog@6.0.0
system.diagnostics.fileversioninfo@4.0.0
system.diagnostics.process@4.1.0
system.diagnostics.stacktrace@4.0.1
system.diagnostics.tools@4.0.1
system.diagnostics.tracing@4.1.0
system.dynamic.runtime@4.0.11
system.globalization.calendars@4.0.1
system.globalization.extensions@4.0.1
system.globalization@4.0.11
system.io.compression.zipfile@4.0.1
system.io.compression@4.1.0
system.io.filesystem.primitives@4.0.1
system.io.filesystem.watcher@4.0.0
system.io.filesystem@4.0.1
system.io.memorymappedfiles@4.0.0
system.io.pipelines@6.0.0
system.io.unmanagedmemorystream@4.0.1
system.io@4.1.0
system.linq.expressions@4.1.0
system.linq.parallel@4.0.1
system.linq.queryable@4.0.1
system.linq@4.1.0
system.net.http@4.1.0
system.net.nameresolution@4.0.0
system.net.primitives@4.0.11
system.net.requests@4.0.11
system.net.security@4.0.0
system.net.sockets@4.1.0
system.net.webheadercollection@4.0.1
system.numerics.vectors@4.1.1
system.numerics.vectors@4.5.0
system.objectmodel@4.0.12
system.reflection.dispatchproxy@4.0.1
system.reflection.emit.ilgeneration@4.0.1
system.reflection.emit.lightweight@4.0.1
system.reflection.emit@4.0.1
system.reflection.extensions@4.0.1
system.reflection.metadata@1.3.0
system.reflection.metadata@1.6.0
system.reflection.primitives@4.0.1
system.reflection.typeextensions@4.1.0
system.reflection@4.1.0
system.resources.reader@4.0.0
system.resources.resourcemanager@4.0.1
system.runtime.compilerservices.unsafe@6.0.0
system.runtime.extensions@4.1.0
system.runtime.handles@4.0.1
system.runtime.interopservices.runtimeinformation@4.0.0
system.runtime.interopservices@4.1.0
system.runtime.loader@4.0.0
system.runtime.numerics@4.0.1
system.runtime@4.1.0
system.security.claims@4.0.1
system.security.cryptography.algorithms@4.2.0
system.security.cryptography.cng@4.2.0
system.security.cryptography.csp@4.0.0
system.security.cryptography.encoding@4.0.0
system.security.cryptography.openssl@4.0.0
system.security.cryptography.primitives@4.0.0
system.security.cryptography.protecteddata@4.5.0
system.security.cryptography.x509certificates@4.1.0
system.security.principal.windows@4.0.0
system.security.principal@4.0.1
system.text.encoding.codepages@4.0.1
system.text.encoding.extensions@4.0.11
system.text.encoding@4.0.11
system.text.regularexpressions@4.1.0
system.threading.overlapped@4.0.1
system.threading.tasks.dataflow@4.6.0
system.threading.tasks.extensions@4.0.0
system.threading.tasks.parallel@4.0.1
system.threading.tasks@4.0.11
system.threading.thread@4.0.0
system.threading.threadpool@4.0.10
system.threading.timer@4.0.1
system.threading@4.0.11
system.xml.readerwriter@4.0.11
system.xml.xdocument@4.0.11
system.xml.xmldocument@4.0.1
system.xml.xpath.xdocument@4.0.1
system.xml.xpath@4.0.1
tmds.dbus.protocol@0.16.0
validation@2.4.18
xunit.abstractions@2.0.2
xunit.abstractions@2.0.3
xunit.analyzers@1.16.0
xunit.assert@2.9.2
xunit.core@2.9.2
xunit.extensibility.core@2.4.0
xunit.extensibility.core@2.9.2
xunit.extensibility.execution@2.4.0
xunit.extensibility.execution@2.9.2
xunit.runner.visualstudio@2.8.2
xunit.skippablefact@1.4.13
xunit@2.9.2
"

inherit dotnet-pkg

DESCRIPTION="Secure Git credential storage supporing GitHub, Azure Repos, and other services"
HOMEPAGE="https://github.com/git-ecosystem/git-credential-manager"
SRC_URI="
	https://github.com/git-ecosystem/git-credential-manager/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${NUGET_URIS}
"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DOTNET_PKG_PROJECTS=(
	"${S}"/src/shared/Git-Credential-Manager
)
