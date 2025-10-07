<?xml version="1.0" encoding="UTF-8" ?>
<object class="Robot" serializationversion="2">
  <prologue>
    <saved-by-versions>
      <version>11.3.0.2</version>
    </saved-by-versions>
    <file-type>robot</file-type>
    <referenced-types/>
    <triggers/>
    <sub-robots/>
    <device-mappings/>
    <comment/>
    <tags/>
    <referenced-snippets/>
    <typed-variables/>
    <parameters/>
    <return-variables/>
    <store-in-database-variables/>
    <browser-engine>WEBKIT</browser-engine>
  </prologue>
  <property name="variables" class="Variables">
    <object class="Variable" serializationversion="1">
      <property name="name" class="String" id="0">stdout</property>
      <property name="global" class="Boolean" id="1">true</property>
      <property name="initialAssignment" class="InitialVariableAssignment" id="2">
        <property name="type" class="SimpleTypeReference">
          <property name="simpleTypeId" class="Integer">13</property>
        </property>
      </property>
    </object>
    <object class="Variable" serializationversion="1">
      <property name="name" class="String" id="3">stderr</property>
      <property name="global" idref="1"/>
      <property name="initialAssignment" idref="2"/>
    </object>
    <object class="Variable" serializationversion="1">
      <property name="name" class="String" id="4">exit_code</property>
      <property name="global" idref="1"/>
      <property name="initialAssignment" class="InitialVariableAssignment">
        <property name="type" class="SimpleTypeReference">
          <property name="simpleTypeId" class="Integer">12</property>
        </property>
      </property>
    </object>
  </property>
  <property name="proxyServerConfiguration" class="ProxyServerConfiguration" serializationversion="0"/>
  <property name="httpClientType" class="HttpClientType">
    <property name="enum-name" class="String">WEBKIT</property>
  </property>
  <property name="ntlmAuthentication" class="NTLMAuthenticationType">
    <property name="enum-name" class="String">STANDARD</property>
  </property>
  <property name="usePre96DefaultWaiting" class="Boolean" id="5">false</property>
  <property name="maxWaitForTimeout" class="Integer">10000</property>
  <property name="waitRealTime" idref="5"/>
  <property name="privateHTTPCacheEnabled" idref="1"/>
  <property name="privateHTTPCacheSize" class="Integer">2048</property>
  <property name="comment">
    <null/>
  </property>
  <property name="tags" class="RobotTagList"/>
  <property name="humanProcessingTime">
    <null/>
  </property>
  <property name="executionMode" class="ExecutionMode">
    <property name="enum-name" class="String">FULL</property>
  </property>
  <property name="avoidExternalReExecution" idref="5"/>
  <property name="transitionGraph" class="Body">
    <blockBeginStep class="BlockBeginStep" id="6"/>
    <steps class="ArrayList">
      <object class="Transition" serializationversion="3" id="7">
        <property name="name" class="String">Execute Command Line</property>
        <property name="stepAction" class="ExecuteCommandLine" serializationversion="0">
          <property name="commandLineExpression" class="kapow.robot.plugin.common.support.expression.stringexpr.ValueStringExpression">
            <property name="value" class="String">ping localhost</property>
          </property>
          <property name="extractionType" class="kapow.robot.plugin.common.stateprocessor.executecommandline.SeperateStdOutAndErrExtractionType">
            <property name="storeOutDataIn" class="kapow.robot.plugin.common.support.AttributeName2">
              <property name="name" idref="0"/>
            </property>
            <property name="storeErrDataIn" class="kapow.robot.plugin.common.support.AttributeName2">
              <property name="name" idref="3"/>
            </property>
          </property>
          <property name="exitCodeStoredIn" class="kapow.robot.plugin.common.support.AttributeName2">
            <property name="name" idref="4"/>
          </property>
          <property name="executeInRoboMaker" idref="1"/>
        </property>
        <property name="elementFinders" class="ElementFinders" id="8"/>
        <property name="errorHandler" class="ErrorHandler" serializationversion="0" id="9"/>
        <property name="comment">
          <null/>
        </property>
        <property name="enabled" idref="1"/>
        <property name="changedProperties" class="java.util.HashSet" id="10"/>
      </object>
      <object class="Transition" serializationversion="3" id="11">
        <property name="name" class="String">Log stdout</property>
        <property name="stepAction" class="WriteLog2">
          <property name="expression" class="Expression" serializationversion="1">
            <property name="text" class="String">"\nExit code: " + exit_code +
"\nstdout:\n" + stdout</property>
          </property>
        </property>
        <property name="elementFinders" idref="8"/>
        <property name="errorHandler" idref="9"/>
        <property name="comment">
          <null/>
        </property>
        <property name="enabled" idref="1"/>
        <property name="changedProperties" class="java.util.HashSet" id="12">
          <element class="String">name</element>
        </property>
      </object>
      <object class="Try" id="13"/>
      <object class="Transition" serializationversion="3" id="14">
        <property name="name" class="String">stderr ?</property>
        <property name="stepAction" class="TestValue" serializationversion="0">
          <property name="condition" class="Expression" serializationversion="1">
            <property name="text" class="String">exit_code == 1 || length(stderr) &gt; 0</property>
          </property>
          <property name="mode" class="Integer">1</property>
        </property>
        <property name="elementFinders" idref="8"/>
        <property name="errorHandler" class="ErrorHandler" serializationversion="0">
          <property name="reportingViaAPI" idref="5"/>
          <property name="reportingViaLog" idref="5"/>
          <property name="controlFlow" class="kapow.robot.robomaker.robot.ControlFlow$NextAlternative"/>
        </property>
        <property name="comment">
          <null/>
        </property>
        <property name="enabled" idref="1"/>
        <property name="changedProperties" idref="12"/>
      </object>
      <object class="End" id="15"/>
      <object class="Transition" serializationversion="3" id="16">
        <property name="name" class="String">Generate Error</property>
        <property name="stepAction" class="GenerateError">
          <property name="errorMessageExpression" class="Expression" serializationversion="1">
            <property name="text" class="String">"\nCommand Line Error:\n" + stderr</property>
          </property>
        </property>
        <property name="elementFinders" idref="8"/>
        <property name="errorHandler" idref="9"/>
        <property name="comment">
          <null/>
        </property>
        <property name="enabled" idref="1"/>
        <property name="changedProperties" idref="10"/>
      </object>
      <object class="End" id="17"/>
    </steps>
    <blockEndStep class="BlockEndStep"/>
    <edges class="ArrayList">
      <object class="TransitionEdge">
        <from idref="6"/>
        <to idref="7"/>
        <name/>
        <comment/>
      </object>
      <object class="TransitionEdge">
        <from idref="7"/>
        <to idref="11"/>
        <name/>
        <comment/>
      </object>
      <object class="TransitionEdge">
        <from idref="11"/>
        <to idref="13"/>
        <name/>
        <comment/>
      </object>
      <object class="TransitionEdge">
        <from idref="13"/>
        <to idref="14"/>
        <name/>
        <comment/>
      </object>
      <object class="TransitionEdge">
        <from idref="13"/>
        <to idref="16"/>
        <name/>
        <comment/>
      </object>
      <object class="TransitionEdge">
        <from idref="14"/>
        <to idref="15"/>
        <name/>
        <comment/>
      </object>
      <object class="TransitionEdge">
        <from idref="16"/>
        <to idref="17"/>
        <name/>
        <comment/>
      </object>
    </edges>
  </property>
  <property name="browserConfigurationSpecification" class="BrowserConfigurationSpecificationWebKit" serializationversion="27"/>
</object>
