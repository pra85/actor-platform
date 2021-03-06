package im.actor.core.api.rpc;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import im.actor.runtime.bser.*;
import im.actor.runtime.collections.*;

import static im.actor.runtime.bser.Utils.*;

import im.actor.core.network.parser.*;

import org.jetbrains.annotations.Nullable;
import org.jetbrains.annotations.NotNull;

import com.google.j2objc.annotations.ObjectiveCName;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import im.actor.core.api.*;

public class RequestLoadEphermalPublicKeys extends Request<ResponsePublicKeys> {

    public static final int HEADER = 0xa2b;

    public static RequestLoadEphermalPublicKeys fromBytes(byte[] data) throws IOException {
        return Bser.parse(new RequestLoadEphermalPublicKeys(), data);
    }

    private ApiUserOutPeer userPeer;
    private long keyGroupId;

    public RequestLoadEphermalPublicKeys(@NotNull ApiUserOutPeer userPeer, long keyGroupId) {
        this.userPeer = userPeer;
        this.keyGroupId = keyGroupId;
    }

    public RequestLoadEphermalPublicKeys() {

    }

    @NotNull
    public ApiUserOutPeer getUserPeer() {
        return this.userPeer;
    }

    public long getKeyGroupId() {
        return this.keyGroupId;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.userPeer = values.getObj(1, new ApiUserOutPeer());
        this.keyGroupId = values.getLong(2);
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        if (this.userPeer == null) {
            throw new IOException();
        }
        writer.writeObject(1, this.userPeer);
        writer.writeLong(2, this.keyGroupId);
    }

    @Override
    public String toString() {
        String res = "rpc LoadEphermalPublicKeys{";
        res += "userPeer=" + this.userPeer;
        res += ", keyGroupId=" + this.keyGroupId;
        res += "}";
        return res;
    }

    @Override
    public int getHeaderKey() {
        return HEADER;
    }
}
